# Maintainer: KevinCrrl

pkgname=evillimiter-ng
pkgver=2.0.0
pkgrel=2
pkgdesc='Evil Limiter Next Generation.'
arch=('any')
url='https://github.com/KevinCrrl/evillimiter-ng'
license=('MIT')
depends=(
  'python' 'python-scapy' 'python-rich' 'python-netaddr' 'python-netifaces'
)
makedepends=(
  'python-build' 'python-installer' 'python-wheel' 'python-setuptools'
)
source=("${url}/archive/refs/tags/${pkgver}/${pkgver}.tar.gz")
sha512sums=('b8e0cff2f43c7c8baa9c73503b296fda31ab63ff2443892c29e6f85cad839df502a9f333ef758c7a1807ed7bb5c444b298855ed64308c413fc97cd91a242e3ff')

build() {
  cd "$pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
}


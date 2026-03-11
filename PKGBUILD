# Maintainer: KevinCrrl

pkgname=evillimiter-ng
pkgver=2.1.0
pkgrel=1
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
sha512sums=('3648ede666c7193e18a624748013f908be0a01cf06f6367ed9d5dd8f60a1a706c175d8926ae36a19275f1ab4bd6d90f422b9cc41cf053e04c25d0f47fb4b6e34')

build() {
  cd "$pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
}


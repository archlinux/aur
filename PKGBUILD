# Maintainer: KevinCrrl

pkgname=evillimiter-ng
pkgver=2.2.0
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
sha512sums=('36e344c04586187b592bd2afbf4ff84dd12ac4abd987533ae46752be0ba35a7183984201698137fd11198159cb54799b2738d682f084b2fb9695e58f80b795e6')

build() {
  cd "$pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
}


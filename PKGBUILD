# Maintainer: KevinCrrl

pkgname=evillimiter-ng
pkgver=2.4.0
pkgrel=1
pkgdesc='Evil Limiter Next Generation.'
arch=('any')
url='https://github.com/KevinCrrl/evillimiter-ng'
license=('GPL-2.0-only')
depends=(
  'python' 'python-scapy' 'python-rich' 'python-netaddr' 'python-netifaces2'
  'python-prompt_toolkit' 'iptables'
)
makedepends=(
  'python-build' 'python-installer' 'python-wheel' 'python-hatchling'
)
source=("${url}/archive/refs/tags/${pkgver}/${pkgver}.tar.gz")
sha512sums=('71daaa0631912aae7e957d041254e3888b67a601772ac351ca71b793f8a8637a11481aa68160f4af792a9bbfaca1fc7a780559ea2da5d3b5afa6ec5b3b7557aa')

build() {
  cd "$pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
}


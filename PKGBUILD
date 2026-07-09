# Maintainer: KevinCrrl

pkgname=evillimiter-ng
pkgver=2.4.2
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
sha512sums=('9d12df56c0550c95d535a5998205052fff543044af873dc2df08a669d0334c223040e81c826e3cf2a4c530c5180e9b4c32b2076bb142bbe1f5a9ca00305ac01a')

build() {
  cd "$pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
}


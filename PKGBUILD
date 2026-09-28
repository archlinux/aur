# Maintainer: KevinCrrl <kevincrrl@tuta.io>

pkgname=evillimiter-ng
pkgver=3.0.3
pkgrel=1
pkgdesc='Evil Limiter Next Generation.'
arch=('any')
url='https://github.com/KevinCrrl/evillimiter-ng'
license=('GPL-2.0-only')
depends=(
  'python' 'python-scapy' 'python-rich' 'python-netaddr' 'python-psutil'
  'python-prompt_toolkit' 'nftables'
)
makedepends=(
  'python-build' 'python-installer' 'python-wheel' 'python-hatchling'
)
source=("${url}/archive/refs/tags/${pkgver}/${pkgver}.tar.gz")
sha512sums=('d31a14ad4668b22a5bb4ff1c84575ffb6ccce5e6e8f81e921fac6de865970d560b46b0aa44a0a9aea5beac50e0f4b3bfe8cf8743f8064f09a45fd04bd2db459e')

build() {
  cd "$pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
}


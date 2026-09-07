# Maintainer: KevinCrrl <kevincrrl@tuta.io>

pkgname=evillimiter-ng
pkgver=3.0.1
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
sha512sums=('78163e7ae49f69b1511fde96f33dcd0aa0447b595548ecb85b4992f1de3efea9f48ab5efcd8b4df273b2300d50c588a10acfcd5f4778ef70e21bf848c944d7f5')

build() {
  cd "$pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
}


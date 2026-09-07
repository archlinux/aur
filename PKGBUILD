# Maintainer: KevinCrrl <kevincrrl@tuta.io>

pkgname=evillimiter-ng
pkgver=3.0.0
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
sha512sums=('a9d3802f58e9d1fdc57701fa26386e570b2c6c2f383026e4c3eacd255aa841f2730afd6ab5fe68f4f3bb26d9fc3cce0fc5b96d14e357ee21667db55d964804a9')

build() {
  cd "$pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
}


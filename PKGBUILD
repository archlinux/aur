# Maintainer: Deon Spengler <deon@spengler.co.za>

pkgname=python-stupidartnet
pkgver=1.6.0
pkgrel=2
pkgdesc="Simple Art-Net implementation in Python"
arch=(any)
url="https://github.com/cpvalente/stupidArtnet"
license=(MIT)
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://github.com/cpvalente/stupidArtnet/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('55c64a1467d621917d93f2dd0248befb291b08ee2ad0c40411528a71deadf4d0')

build() {
  cd "stupidArtnet-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "stupidArtnet-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

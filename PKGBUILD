# Maintainer: Pierce Lopez <pierce.lopez@gmail.com>

pkgname=go-gpm
pkgver=1.4.0
pkgrel=2
pkgdesc="Barebones dependency manager for Go."
arch=("any")
url="https://github.com/pote/gpm"
license=('MIT')
depends=("go")
source=("gpm-${pkgver}.tar.gz::https://github.com/pote/gpm/archive/v${pkgver}.tar.gz")
sha256sums=('2e213abbb1a12ecb895c3f02b74077d3440b7ae3221b4b524659c2ea9065b02a')

build() {
  cd gpm-$pkgver
  # avoid conflict with existing core/gpm package
  ./configure --prefix=/usr --exec=go-gpm
  make
}

package() {
  cd gpm-$pkgver
  make DESTDIR="$pkgdir" install
}

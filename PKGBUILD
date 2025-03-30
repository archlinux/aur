# Maintainer: Pixel

pkgname=pinors
pkgver=0.1.2
pkgrel=1
pkgdesc="simple pretty minimal notification app for Unix (x11)"
arch=('x86_64' 'aarch64')
url="https://github.com/Pixel2175/pino-rs"
license=('GPL3')
depends=('gcc-libs')
makedepends=('rust' 'cargo' 'git' 'make')
source=("git+https://github.com/Pixel2175/walrs.git")
sha256sums=('1d226a5b8a28bd1f6a865b3611c18ae630ec14fa91e265ff2ce782de03c85842')

build() {
  cd "$srcdir/$pkgname"
  make build
}

check() {
  cd "$srcdir/$pkgname"
  make check
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}


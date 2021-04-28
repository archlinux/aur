# Maintainer: Dan Elkouby <streetwalrus@codewalr.us>
# Maintainer: Hydral <nathan.dacunha.nd@gmail.com>

pkgname=3dstools
pkgver=1.1.5
pkgrel=1
pkgdesc="Various tools for 3DS development"
arch=('x86_64')
url="https://github.com/devkitPro/3dstools"
license=('unknown')
depends=('gcc-libs')
source=("https://github.com/devkitPro/3dstools/archive/refs/tags/v1.1.5.tar.gz")
sha256sums=('47b6a830e583631708d5919e50c7e0155b378bf8f42aa0a5fb56c3f9b5d898dc')

build() {
  cd "$srcdir/3dstools-$pkgver"

  sh autogen.sh
  ./configure --prefix="/usr"
  make
}

package() {
  cd "$srcdir/3dstools-$pkgver"

  make install DESTDIR="$pkgdir/"
}

# vim:set ts=2 sw=2 et:

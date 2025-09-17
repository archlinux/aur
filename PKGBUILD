# Maintainer: Dan Elkouby <streetwalrus@codewalr.us>
# Maintainer: Hydral <nathan.dacunha.nd@gmail.com>

pkgname=3dstools
pkgver=1.3.1
pkgrel=1
pkgdesc="Various tools for 3DS development"
arch=('x86_64')
url="https://github.com/devkitPro/3dstools"
license=('unknown')
depends=('gcc-libs')
source=("https://github.com/devkitPro/3dstools/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a1eab5138ad985f6fb3e999706a51300c363399bb1a83ec5a052958ed74d8f45')

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

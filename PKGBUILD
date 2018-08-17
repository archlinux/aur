# Maintainer: Dan Elkouby <streetwalrus@codewalr.us>

pkgname=3dstools
pkgver=1.1.4
pkgrel=1
pkgdesc="Various tools for 3DS development"
arch=('x86_64')
url="https://github.com/devkitPro/3dstools"
license=('unknown')
depends=('gcc-libs')
source=("https://github.com/devkitPro/3dstools/releases/download/v$pkgver/3dstools-$pkgver.tar.bz2")
sha256sums=('d41cab378fbc5210c2a5dc68987b020c9dafea641d39edc087c69ea78f5d6fb0')

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

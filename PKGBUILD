# Maintainer: Dan Elkouby <streetwalrus@codewalr.us>
# Maintainer: Hydral <nathan.dacunha.nd@gmail.com>

pkgname=3dstools
pkgver=1.2.0
pkgrel=1
pkgdesc="Various tools for 3DS development"
arch=('x86_64')
url="https://github.com/devkitPro/3dstools"
license=('unknown')
depends=('gcc-libs')
source=("https://github.com/devkitPro/3dstools/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('774fda73b4dc98074e1006618b7d48b81fbaac6c7aa30ce52ba979aac38eed45')

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

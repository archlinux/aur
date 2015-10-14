# Maintainer: maz-1 <ohmygod19993 at gmail dot com>
pkgname=sfarklib
_gitname=sfArkLib
pkgver=20150617
pkgrel=1
pkgdesc="Original library for SoundFont compression."
arch=(i686 x86_64)
url="https://github.com/raboof/sfArkLib"
license=('GPL3')
depends=('zlib')
makedepends=('git')
source=('git+https://github.com/raboof/sfArkLib.git')
md5sums=('SKIP')

pkgver() {
  cd  "$srcdir/$_gitname"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}
prepare() {
    cd  "$srcdir/$_gitname"
    sed -i 's:/usr/local/:/usr/:g' Makefile
}
build() {
  cd "$srcdir/$_gitname"
  make

}

package() {
  cd "$srcdir/$_gitname"

  make DESTDIR="$pkgdir" install
}


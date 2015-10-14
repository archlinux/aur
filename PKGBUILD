# Maintainer: maz-1 <ohmygod19993 at gmail dot com>
pkgname=sfarkxtc
_gitname=$pkgname
pkgver=20150311
pkgrel=1
pkgdesc="Basic sfArk decompressor ."
arch=(i686 x86_64)
url="https://github.com/raboof/sfarkxtc"
license=('GPL3')
depends=('zlib' 'sfarklib')
makedepends=('git')
source=('git+https://github.com/raboof/sfarkxtc.git')
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


# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

pkgname=nnn
pkgver=1.2
pkgrel=1
pkgdesc="Free, fast, friendly file browser"
arch=("i686" "x86_64")
depends=("ncurses" "readline")
url="https://github.com/jarun/nnn"
license=('CUSTOM')
source=("https://github.com/jarun/nnn/archive/v${pkgver//_/-}.tar.gz")
md5sums=('d0e30c10b14d87750ef9be653553c6fa')

build() {
    sed -i -e "s#<ncursesw/curses.h>#<curses.h>#g" $srcdir/$pkgname-$pkgver/nnn.c
}

package() {
  make -C "${pkgname}-$pkgver" DESTDIR="${pkgdir}" PREFIX="/usr" install
}

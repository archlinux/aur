# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

pkgname=nnn
pkgver=1.1
pkgrel=1
pkgdesc="Free, fast, friendly file browser"
arch=("i686" "x86_64")
depends=("ncurses" "readline")
url="https://github.com/jarun/nnn"
license=('CUSTOM')
source=("https://github.com/jarun/nnn/archive/v${pkgver//_/-}.tar.gz")
md5sums=('ee7432bffd8c3b1bc710e9d202cbd263')

build() {
    sed -i -e "s#<ncursesw/curses.h>#<curses.h>#g" $srcdir/$pkgname-$pkgver/nnn.c
}

package() {
  make -C "${pkgname}-$pkgver" DESTDIR="${pkgdir}" PREFIX="/usr" install
}

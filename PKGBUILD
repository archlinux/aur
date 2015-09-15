# Maintainer: bobi

pkgname=germinal
pkgver=13
pkgrel=1
pkgdesc="Minimalist terminal emulator based on vte and tmux"

license=('GPL3')
url="https://github.com/Keruspe/Germinal"
source=("http://www.imagination-land.org/files/$pkgname/$pkgname-$pkgver.tar.xz")

makedepends=('intltool')

depends=('glib2' 'vte3' 'pango' 'tmux')

arch=('i686' 'x86_64')
md5sums=('1d32a684dae5b7874307cd677f037c80')

build () {
    cd "$srcdir/$pkgname-$pkgver"

    ./configure --sysconfdir=/etc       \
		--libexecdir=/usr/lib
    make
}

package () {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
# expandtab:tabstop=4:shiftwidth=4

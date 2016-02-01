# Maintainer: bobi

pkgname=germinal
pkgver=15
pkgrel=1
pkgdesc="Minimalist terminal emulator based on vte and tmux"

license=('GPL3')
url="https://github.com/Keruspe/Germinal"
source=("http://www.imagination-land.org/files/$pkgname/$pkgname-$pkgver.tar.xz")

makedepends=('intltool' 'appstream-glib')

depends=('glib2' 'vte3' 'pango' 'tmux')

install=$pkgname.install

arch=('i686' 'x86_64')
md5sums=('c1ef274e8aa88e9b4f35de52a34b4159')

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

# Maintainer: bobi

pkgname=germinal
pkgver=20
pkgrel=1
pkgdesc="Minimalist terminal emulator based on vte and tmux"

license=('GPL3')
url="https://github.com/Keruspe/Germinal"
source=("http://www.imagination-land.org/files/$pkgname/$pkgname-$pkgver.tar.xz")

makedepends=('intltool' 'appstream-glib')

depends=('glib2' 'vte3' 'pango' 'tmux' 'pcre2')

install=$pkgname.install

arch=('i686' 'x86_64')
md5sums=('59524ac8032502f572af5cfd511c43b4')

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

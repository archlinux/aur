# Maintainer: Jesse R. Adams <jesse -at- techno -dash- geeks -dot- org>
pkgname=tudu
pkgver=0.10
pkgrel=1
pkgdesc="ncurses-based hierarchical todo list manager with vim-like keybindings"
arch=(i686 x86_64)
url="http://code.meskio.net/tudu/"
license=('GPL')
depends=('ncurses')
source=(http://code.meskio.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('4c140d25bf30da1ef5862c14bdefe9cf')

build() {
    cd "$pkgname-$pkgver"

    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package() {
    cd "$pkgname-$pkgver"

    make DESTDIR=$pkgdir install
    install -vDm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

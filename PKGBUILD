# Maintainer: Joseph Lansdowne <J49137@gmail.com>
pkgname=xorg-choose-window
pkgver=0.1.2
pkgrel=1
pkgdesc="Xorg window chooser"
arch=(any)
url=http://ikn.org.uk/xorg-choose-window
license=(Apache)
depends=(libxcb xcb-util-keysyms xcb-util-wm)
source=(http://ikn.org.uk/files/desktop/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('849c4512e9f55d1f7a349c9629a04378')

build () {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package () {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" prefix=/usr install
    cd "$srcdir"
}

# Maintainer: Joseph Lansdowne <J49137@gmail.com>
pkgname=xorg-choose-window
pkgver=0.2.0
pkgrel=1
pkgdesc="Xorg window chooser"
arch=(any)
url=http://ikn.org.uk/tool/xorg-choose-window
license=(Apache)
depends=(libxcb xcb-util-keysyms xcb-util-wm)
source=(http://ikn.org.uk/download/tool/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('71143e2e250e1eb5a1fd282adbd12371')

build () {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package () {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" prefix=/usr install
    cd "$srcdir"
}

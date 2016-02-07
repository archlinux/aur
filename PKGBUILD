# Maintainer: Joseph Lansdowne <J49137@gmail.com>
pkgname=xorg-choose-window
pkgver=0.1.0
pkgrel=1
pkgdesc="Xorg window chooser"
arch=(any)
url=http://ikn.org.uk/xorg-choose-window
license=(Apache)
depends=(libxcb xcb-util-keysyms xcb-util-wm)
optdepends=("pm-utils: suspend support")
source=(http://ikn.org.uk/files/desktop/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=(1c4cdccf1ed60ed841cb912fb22983a6)

build () {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package () {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" prefix=/usr install
    cd "$srcdir"
}

# Maintainer: beest <gnubeest@gmail.com>

pkgname=openyahtzee
pkgver=1.9.3
pkgrel=1
pkgdesc="Open-source version of the classic game Yahtzee"
arch=('x86_64')
url="https://www.openyahtzee.org/"
license=('GPL2')
depends=('wxgtk')
makedepends=('boost')
source=(http://downloads.sourceforge.net/openyahtzee/${pkgname}-${pkgver}.tar.xz)
md5sums=('9bccc2477047c29cb33b8cb23e21ef3c')

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}

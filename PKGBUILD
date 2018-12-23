# Maintainer:  Imants Dureika <imants.dureika@gmail.com>
# Contributor: Marc Baudoin <babafou@babafou.eu.org> 
pkgname=xdemineur
pkgver=2.1.1
pkgrel=1
pkgdesc="A minesweeper game for the X Window System."
arch=('i686' 'x86_64')
url="http://www.babafou.eu.org/xdemineur/"
license=('custom')
depends=('libx11' 'libxpm')
source=(http://www.babafou.eu.org/xdemineur/xdemineur-2.1.1.tar.gz)
sha256sums=('593824412a208a1b75d5b15745a271dc3eba330d41f7718f4826567d04bcbb9b')

build() {
    cd $pkgname-$pkgver
    xmkmf
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir/" install
}

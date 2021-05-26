# Maintainer: Nicolas F. <aur@fratti.ch>
pkgname="pngnq-s9"
pkgver=2.0.2
pkgrel=3
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
pkgdesc="Modified version of pngnq, neural network colour quantizer for PNG images"
url="https://sourceforge.net/projects/pngnqs9/"
conflicts=('pngnq')
depends=('libpng')
makedepends=('pkg-config')
license=('custom')
source=("https://downloads.sourceforge.net/sourceforge/pngnqs9/pngnq-s9-${pkgver}.tar.gz")
sha256sums=('8767dec663f9c8223e8bfad5439f3456bf5037bc702c9b1e783380fae63b4367')

build() {
    cd "$pkgname-$pkgver"
    
    ./configure --prefix=/usr
    make
}

package() {
    
    cd "$pkgname-$pkgver"
    
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    make DESTDIR="$pkgdir/" install
}

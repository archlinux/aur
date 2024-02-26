# Maintainer: Marco Buzzanca <marco dot bzn at gmail dot com>
pkgname=ibm-fonts
pkgver=0.2.0
pkgrel=2
pkgdesc='IBM system and text mode bitmap fonts'
arch=('any')
url='https://farsil.github.io/ibmfonts/'
license=('MIT, CC-BY-SA-4.0')
makedepends=('xorg-bdftopcf')
source=("https://github.com/farsil/ibmfonts/archive/v$pkgver.tar.gz")
sha256sums=('70f9d9d668c304916b0ab2601564ff303720526d090b5929ab712d777420a653')

build() {    
    cd "$srcdir/ibmfonts-$pkgver"

    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/ibmfonts-$pkgver"

    make DESTDIR="$pkgdir" install

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 licenses/MIT "$pkgdir/usr/share/licenses/$pkgname/licenses/MIT"
    install -Dm644 licenses/CC-BY-SA-4.0 "$pkgdir/usr/share/licenses/$pkgname/licenses/CC-BY-SA-4.0"
}

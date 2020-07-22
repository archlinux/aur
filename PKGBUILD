# Maintainer: Marco Buzzanca <marco dot bzn at gmail dot com>
pkgname=ibm-fonts
pkgver=0.1
pkgrel=2
pkgdesc='IBM system and text mode bitmap fonts'
arch=('any')
url='https://farsil.github.io/ibmfonts/'
license=('MIT, custom:CC BY-SA 4.0')
makedepends=('xorg-bdftopcf')
source=("https://github.com/farsil/ibmfonts/archive/$pkgver.tar.gz")
sha256sums=('86f6d295561947f7e0a42e6e2bd405f63625095353468c6a6e752c0cba727dc9')

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

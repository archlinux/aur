# Maintainer: Mariusz Libera <mariusz.libera@gmail.com>
pkgname=rccextended
pkgver=1.0.5
pkgrel=1
pkgdesc="Qt Resource Compiler and Decompiler (RccExtended)"
arch=('x86_64')
url="https://github.com/zedxxx/rccextended"
license=('GPL3')
depends=('qt5-base' 'qt5-declarative')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('693387e9e100a14a0346337b7f9d3be4')

build() {
    cd "$srcdir/$pkgname-$pkgver/src"
    qmake-qt5 rcc.pro
    make
}

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/src/rcc" "$pkgdir/usr/bin/rccextended"
}

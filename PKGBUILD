# Maintainer: TheNiceGuy <gabrielpolloguilbert@gmail.com>

pkgname=vpaint
pkgver=1.5
pkgrel=1
pkgdesc='VPaint is an experimental vector graphics editor based on the Vector Animation Complex technology.'
arch=('i686' 'x86_64')
license=('MIT')
depends=('qt4' 'glu')
makedepends=('gcc' 'make' 'qtchooser')
url='http://www.vpaint.org'
conflicts=()
provides=()
source=("vpaint::https://github.com/dalboris/vpaint/archive/v$pkgver.tar.gz")
md5sums=('SKIP')
options=()

build() {
	mkdir -p "$srcdir/$pkgname-$pkgver/build"
    cd       "$srcdir/$pkgname-$pkgver/build"

    qmake ../src/VPaint.pro -r -spec linux-g++   
    make   
}

package() {
    mkdir -p "$pkgdir/usr/bin"

    install -Dm755 "$srcdir/$pkgname-$pkgver/build/VPaint" "$pkgdir/usr/bin/vpaint"
}

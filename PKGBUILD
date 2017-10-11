# Maintainer Sky <sky at gfw dot party>

pkgname=deepin-picker
pkgver=0.3
pkgrel=1
pkgdesc="Color picker tool for deepin."
arch=('any')
url="https://github.com/manateelazycat/deepin-picker"
license=('unknown')
depends=('qt5-base')
makedepends=('git' 'qt5-base')
source=("https://github.com/manateelazycat/deepin-picker/archive/$pkgver.tar.gz")
md5sums=('02d4d05d46c9a0faed356527d3d8d971')

build() {
    mkdir -p "$srcdir"/"$pkgname"-"$pkgver"/build
    cd "$srcdir"/"$pkgname"-"$pkgver"/build
    qmake ..
    make
}

package(){
    cd "$srcdir"/"$pkgname"-"$pkgver"/build
    make install DESTDIR="$pkgdir"
    install -Dm0755 deepin-picker "$pkgdir"/usr/bin/deepin-picker
}
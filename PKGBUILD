# Maintainer: Dusan Mitrovic <dusan@dusanmitrovic.xyz>
pkgname=ipcalculator
pkgver=1.0.3
pkgrel=1
pkgdesc='A small program to calculate various IPv4 parameters.'
arch=('x86_64')
url='https://github.com/dusnm/ipcalculator'
license=('GPL')
source=('https://github.com/dusnm/ipcalculator/archive/v1.0.3.tar.gz')
md5sums=('756bc1284fbaef2831e79b6473571bca')
sha256sums=('a305592bbcb44fdf719e9aebb83859531b91e452b9d4dc758fadb6f3d5e20380')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    mkdir -p "$pkgdir/usr/bin/"
    make DESTDIR="$pkgdir" PREFIX="/usr" install
}

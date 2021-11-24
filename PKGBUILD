# Maintainer: Dusan Mitrovic <dusan@dusanmitrovic.xyz>
pkgname=ipcalculator
pkgver=1.0.4
pkgrel=2
pkgdesc='A small program to calculate various IPv4 parameters.'
arch=('x86_64')
url='https://github.com/dusnm/ipcalculator'
license=('GPL')
source=('https://github.com/dusnm/ipcalculator/archive/refs/tags/v1.0.4.tar.gz')
md5sums=('67c4997f932d78fe388a4c43e5fc8ddb')
sha256sums=('01f92a1a0e721e9ce9227fd71fa0f020fde73f714a35860bb7cf18e16a1241f0')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    mkdir -p "$pkgdir/usr/bin/"
    make DESTDIR="$pkgdir" PREFIX="/usr" install
}

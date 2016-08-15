# Maintainer: Marco Scarpetta <marcoscarpetta02@gmail.com>
pkgname=scopa
pkgver=1.0.0b1
pkgrel=1
pkgdesc='The italian card game Scopa'
arch=('i686' 'x86_64')
url='http://www.nongnu.org/scopa/'
license=('GPL3')
depends=('qt5-webengine')
source=("http://download.savannah.gnu.org/releases/scopa/$pkgname-$pkgver.tar.gz"
        "http://download.savannah.gnu.org/releases/scopa/$pkgname-$pkgver.tar.gz.sig")
md5sums=('0a473ecbe287d4f78551c9cdce897fab'
         'SKIP')
validpgpkeys=('BFED85CB6D5C7A7B09F18CB9DB42C70BFF227585')

build() {
    cd $pkgname-$pkgver
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir/" install
}

# Maintainer: Tamir Zahavi-Brunner <tamir.z3@gmail.com> 
pkgname=xgetres
pkgver=1.0
pkgrel=1
pkgdesc="Get the value of an X resource"
arch=('x86_64')
url="https://github.com/tamirzb/xgetres"
license=('MIT')
depends=('libx11')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tamirzb/xgetres/archive/$pkgver.tar.gz")
md5sums=('862c639b5112cb83765cb516c0a311a0')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    make PREFIX="$pkgdir/usr" install
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

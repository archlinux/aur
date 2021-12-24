# Maintainer Alfred Jophy alfredjophy <at> protonmail <dot> com
pkgname=motivate
pkgdesc="Gives you a motivational quote"
pkgver=1.4.0
pkgrel=1
url="https://github.com/AlfredEVOL/motivate"
arch=('x86_64')
license=('MIT')
source=("https://github.com/AlfredEVOL/motivate/archive/refs/tags/$pkgver.tar.gz")
md5sums=('SKIP')
build (){
    cd "$pkgname-$pkgver"
    make
}
package() {
        cd "$pkgname-$pkgver"        
        mkdir -p $pkgdir/usr/share/$pkgname
        mkdir -p $pkgdir/usr/bin
        cp build/motivate "$pkgdir/usr/bin/"
        cp build/data/quotes.map $pkgdir/usr/share/$pkgname
        cp build/data/quotes.txt  $pkgdir/usr/share/$pkgname
}

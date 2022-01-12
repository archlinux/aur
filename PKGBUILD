# Maintainer Alfred Jophy alfredjophy <at> protonmail <dot> com
pkgname=motivate
pkgdesc="Gives you a motivational quote"
pkgver=1.5.0
pkgrel=2
url="https://github.com/AlfredEVOL/motivate"
arch=('x86_64')
license=('MIT')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f45219945d0568b08863845c2769d9c38838da61e49de4aaebd1a30d518b3440')
provides=('motivate')
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
        install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}


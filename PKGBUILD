# Maintainer: Furdox <furdox at furdox dot tk>
pkgname=meow
pkgver=1.0
pkgrel=1
pkgdesc="A simple python-based script that generates a random cat."
arch=('any')
license=('GPL')
source=('meow.sh' 'cats.txt')
depends=('python')
sha256sums=('SKIP' 'SKIP')

package() {
    install -d "$pkgdir/etc/meow/"
    install -Dm755 "$srcdir/meow.sh" "$pkgdir/usr/bin/meow"
    install -Dm644 "$srcdir/cats.txt" "$pkgdir/etc/meow/cats.txt.default"
    cats="/etc/meow/cats.txt"
    nocats="$pkgdir/etc/meow/cats.txt.default"

    if [ ! -f "$cats" ]; then
    	sudo cp "$nocats" "$pkgdir/etc/meow/cats.txt"
    fi
    if [ -f "$cats" ]; then
    	sudo cp "$cats" "$pkgdir/etc/meow/cats.txt"
    fi
}

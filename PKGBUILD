pkgname=hexamorse
pkgver=1.1
pkgrel=6
pkgdesc="Terminal-based Morse code typing tool"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/Hexa-Programmer/HexaMorse"
license=('MIT')
depends=('python' 'ncurses')
makedepends=('git')
source=("${pkgname}::git+https://github.com/Hexa-Programmer/HexaMorse.git")
sha256sums=('SKIP')

package() {

    cd "$srcdir/$pkgname"

    install -Dm755 *.py "$pkgdir/usr/bin/hexamorse"
    
    if [ -f "README.md" ]; then
        install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    fi
}
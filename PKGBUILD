pkgname=hfc
pkgver=0.1
pkgrel=1
pkgdesc="hfc - hosts file client"
arch=('x86_64')
url="https://git.marlonivo.com/hfc/log.html"
license=('MIT')
depends=('curl' 'ncurses')
makedepends=('gcc' 'make')
source=("git+https://aur.archlinux.org/hfc.git")
md5sums=('SKIP')

build() {
    cd "$srcdir/hfc"
    make
}

package() {
    cd "$srcdir/hfc"
    install -Dm755 hfc "$pkgdir/usr/bin/hfc"
    install -Dm644 hfc.1 "$pkgdir/usr/share/man/man1/hfc.1"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

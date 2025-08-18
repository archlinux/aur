pkgname=hfc
pkgver=0.0.1
pkgrel=1
pkgdesc="hfc - hosts file client"
arch=('x86_64')
url="https://git.marlonivo.xyz/hfc"
license=('MIT')
depends=('curl' 'ncurses')
makedepends=('gcc' 'make')
source=("hfc::git+https://git.marlonivo.xyz/hfc")
md5sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    make
}

package() {
    cd "$srcdir/$pkgname"

    # Binaryfile
    install -Dm755 hfc "$pkgdir/usr/bin/hfc"

    # Manpage
    install -Dm644 hfc.1 "$pkgdir/usr/share/man/man1/hfc.1"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

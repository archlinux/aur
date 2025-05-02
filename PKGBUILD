# Maintainer: Raj Acharya <razzacharya6@gmail.com>
pkgname=razzshell
pkgver=1.0.2
pkgrel=1
pkgdesc="A custom Unix shell with unique features"
arch=('x86_64')
url="https://github.com/rajacharya987/razzshell"
license=('MIT')
depends=('readline' 'ncurses')
source=("https://github.com/rajacharya987/razzshell/releases/download/v1.0.2/razzshell-1.0.2.tar.gz")
sha256sums=('56d44a7f42da6fcdd15b42fc18aa361c3a4cf93768a6ebb3b7317a317048e608')

prepare() {
    cd "$srcdir"
}

build() {
    cd "$srcdir"
    gcc -o razzshell razzshell.c -lreadline -ldl -lncurses
}

package() {
    cd "$srcdir"
    install -Dm755 razzshell "$pkgdir/usr/bin/razzshell"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

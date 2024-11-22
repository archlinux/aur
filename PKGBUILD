# Maintainer: Raj Acharya <razzacharya6@gmail.com>
pkgname=razzshell
pkgver=1.0.1
pkgrel=1
pkgdesc="A custom Unix shell with unique features"
arch=('x86_64')
url="https://github.com/rajacharya987/razzshell"
license=('MIT')
depends=('readline')
source=("https://github.com/rajacharya987/razzshell/releases/download/v1.0.1/razzshell-1.0.1.tar.gz")
sha256sums=('41047d20bdb4f0dece2a53a61cf5865427835385958e242d5f6eb19847ff6945')

prepare() {
    cd "$srcdir"
}

build() {
    cd "$srcdir"
    gcc -o razzshell razzshell.c -lreadline -ldl
}

package() {
    cd "$srcdir"
    install -Dm755 razzshell "$pkgdir/usr/bin/razzshell"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

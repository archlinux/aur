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
sha256sums=('71fa426faa8332f190539f37aaf403fa68098f6492c254e703a74d61d0783f1b')

prepare() {
    cd "$srcdir/razzshell-$pkgver"
}

build() {
    cd "$srcdir/razzshell-$pkgver"
    gcc -o razzshell razzshell.c -lreadline -ldl -lncurses
}

package() {
    cd "$srcdir/razzshell-$pkgver"
    install -Dm755 razzshell "$pkgdir/usr/bin/razzshell"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

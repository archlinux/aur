# Maintainer: bearcry55 <deepnaryanbanerjee@gmail.com>
pkgname=fixy
pkgver=1.0.0
pkgrel=1
pkgdesc="CLI Error Hunter — scan your code and search StackOverflow, GitHub, Reddit. No logins. No BS."
arch=('x86_64' 'aarch64')
url="https://github.com/Bearcry55/fixy"
license=('MIT')
depends=()
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Bearcry55/fixy/archive/refs/heads/main.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/fixy-main"
    go build -o fixy .
}

package() {
    cd "$srcdir/fixy-main"
    install -Dm755 fixy "$pkgdir/usr/bin/fixy"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

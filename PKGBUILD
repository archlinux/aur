# Maintainer: mexus <gilaldpellaeon@gmail.com>
pkgname=dua-cli
pkgver=2.1.3
pkgrel=1
pkgdesc="A tool to conveniently learn about the disk usage of directories, fast!"
arch=('x86_64')
url="https://github.com/Byron/dua-cli"
license=('MIT')
depends=()
makedepends=('cargo')
source=("https://github.com/Byron/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('8c77bf9a2ce04e2e9fed84d773a5ac32')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 755 "target/release/dua" "$pkgdir/usr/bin/dua"
}

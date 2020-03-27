# Maintainer: mexus <gilaldpellaeon@gmail.com>
pkgname=dua-cli
pkgver=2.3.8
pkgrel=1
pkgdesc="A tool to conveniently learn about the disk usage of directories, fast!"
arch=('x86_64')
url="https://github.com/Byron/dua-cli"
license=('MIT')
depends=()
makedepends=('cargo')
source=("https://github.com/Byron/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('ac49a90e54b40b19ee74b182a7e563c7')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 755 "target/release/dua" "$pkgdir/usr/bin/dua"
}

# Maintainer: fk29g <fk29g.uphill912@slmails.com>
pkgname=clidle
pkgver=0.1.0
pkgrel=1
pkgdesc="Play Wordle from your terminal"
arch=("x86_64")
url="https://github.com/ajeetdsouza/clidle"
license=("MIT")
makedepends=("go")
provides=("clidle")
conflicts=("clidle")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=("acdde70b997abf8bb3e0fbbd6575103d8cbc01567e44a377da05a259c1806f78d7ac4a2105770100a21fdf2a59c5b6ac01a38d73de8a7bcc85d051eb6fcfda97")

build() {
    cd "$pkgname-$pkgver"
    go build -o clidle
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm 0755 clidle "$pkgdir/usr/bin/clidle"
    install -Dm 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Arch-Jason <arch-jason@outlook.com>
pkgname=tminesweeper
pkgver=1.0.1
pkgrel=1
pkgdesc="Minesweeper game in terminal"
arch=(any)
url="https://github.com/langong-dev/tminesweeper"
license=('MIT')
depends=('bash')
makedepends=('gcc' 'git')
source=("git+$url")
md5sums=('SKIP')

build() {
    cd "$pkgname/"
    g++ main.cpp -o "$pkgname"
}

package() {
    cd "$pkgname"
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/$pkgname"
    cp "$pkgname" "$pkgdir/usr/bin"
    chmod 755 "$pkgdir/usr/bin/$pkgname"
    cp -r * "$pkgdir/usr/share/$pkgname"
}

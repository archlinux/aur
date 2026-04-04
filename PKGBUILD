# Maintainer: Davi <davvrakoski@gmail.com>
pkgname=pkgscan
pkgver=0.2.2
pkgrel=1
pkgdesc="A lightweight AUR package security scanner that parses PKGBUILDs for malicious patterns before installation"
arch=('x86_64')
url="https://github.com/davvrakoski/pkgscan"
license=('MIT')
depends=('curl' 'cjson' 'git' 'base-devel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('40185c6de1c846324f50cdc1f51586c17f5a040f6a133f15ddc929a154ab0523')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 pkgscan "$pkgdir/usr/bin/pkgscan"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

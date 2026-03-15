# Maintainer: Davi <davvrakoski@gmail.com>
pkgname=pkgscan
pkgver=0.1.1
pkgrel=1
pkgdesc="A lightweight AUR package security scanner that parses PKGBUILDs for malicious patterns before installation"
arch=('x86_64')
url="https://github.com/davvrakoski/pkgscan"
license=('MIT')
depends=('curl' 'cjson' 'git' 'base-devel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c35dba2660846c14423f6926ddff2712e434eff5a05ba939d68ef5d4f414c791')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 pkgscan "$pkgdir/usr/bin/pkgscan"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

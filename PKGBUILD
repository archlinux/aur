# Maintainer: fk29g <fk29g.uphill912@slmails.com>
pkgname=dbee
pkgver=0.2.2
pkgrel=1
pkgdesc="Fast & Minimalistic Database Browser"
arch=("x86_64")
url="https://github.com/murat-cileli/dbee"
license=("GPL-3.0-only")
makedepends=("go")
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4a1994a02dbc1d6f64aa7a2554f0a172603e7ba1f3fe9b4ab4481f1be1182c7f')

build() {
    cd "$pkgname-$pkgver/src"
    go build
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm 0755 src/$pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: fk29g <fk29g.uphill912@slmails.com>
pkgname=brows
pkgver=0.1.2
pkgrel=1
pkgdesc="CLI tool to browse GitHub releases"
arch=("x86_64")
url="https://github.com/rubysolo/brows"
license=("MIT")
makedepends=("go")
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2010da672e4bc9ce3088a535faeb37974a1c39f233c9514384adfe1d21f412ee')

build() {
    cd "$pkgname-$pkgver"
    go build
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm 0755 $pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

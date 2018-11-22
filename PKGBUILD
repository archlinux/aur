# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=unclutter-xfixes
pkgver=1.4
pkgrel=1
pkgdesc="unclutter-xfixes is a rewrite of unclutter using the x11-xfixes extension"
arch=("x86_64")
url="https://github.com/Airblader/unclutter-xfixes"
license=("MIT")
depends=("libxi" "libx11" "libxfixes" "libev")
makedepends=("asciidoc")
provides=("unclutter")
conflicts=("unclutter" "unclutter-patched")
source=("$pkgname-$pkgver.tar.gz::https://github.com/Airblader/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('f28cd690cfa184fddd3961dda49d14e114dccd5e70d9bac8ca5ebcd5124985b3')

build() {
    cd "$pkgname-$pkgver"
    make all
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=4 sw=4 et:

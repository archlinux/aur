# Maintainer: Monjaris <your@email.com>
pkgname=edex
pkgver=0.1.0
pkgrel=1
pkgdesc="GUI text editor written in C++ with raylib"
arch=('x86_64')
url="https://github.com/Monjaris/Edex"
license=('custom:unlicensed')
depends=('raylib')
source=("$pkgname-$pkgver.zip::$url/archive/refs/heads/main.zip")
sha256sums=('SKIP')

package() {
    cd "Edex-main"

    # install prebuilt binary
    install -Dm755 "edex-linux/edex" "$pkgdir/usr/bin/edex"

    # install fonts
    install -dm755 "$pkgdir/usr/share/edex/fonts"
    cp -r assets/fonts/. "$pkgdir/usr/share/edex/fonts/"

    # install readme
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

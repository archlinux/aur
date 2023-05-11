# Maintainer: Maor Kadosh <maor@avocadosh.xyz>
pkgname=sononym
pkgver=1.4.2
pkgrel=1
pkgdesc="Audio sample manager and categorizer"
arch=("x86_64")
url="https://www.sononym.net"
license=('custom:sononym')

source_x86_64=("https://www.sononym.net/download/sononym-${pkgver}.tar.bz2")
sha256sums_x86_64=('08f08433c1bd2d26be15fcd5d31a7bac06e05f58a2f3c6f8847b135537bdbc23')

package() {
    d="$pkgdir/usr/share/sononym-${pkgver}"
    cd "$srcdir/sononym-${pkgver}"
    mkdir -p "$d"
    cp -r * "$d"
    mkdir -p "$pkgdir/usr/bin"
    ln -s "$d/sononym" "$pkgdir/usr/bin/sononym"

    # copy custom license:
    # https://wiki.archlinux.org/index.php/PKGBUILD#license
    install -Dm644 resources/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

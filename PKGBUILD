# Maintainer: Šimon Leitgeb <leitgeb.simon at gmail dot com>

_pkgname=YosemiteSanFranciscoFont

pkgname=ttf-yosemite-san-francisco-font-git
pkgver=1.0.r2.g5a6e8ca
pkgrel=1
pkgdesc="San Francisco font - the Apple Watch font"
arch=('any')
url="https://github.com/smith-neil/YosemiteSanFranciscoFont"
license=('GPL')
groups=()
depends=()
makedepends=('git')
provides=($_pkgname)
source=('git+https://github.com/smith-neil/YosemiteSanFranciscoFont.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --tags --long | sed -r -e 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,[-_],.,g'
}

package() {
    cd "$srcdir/$_pkgname"
    install -d "$pkgdir/usr/share/fonts/TTF"
    install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF"
}

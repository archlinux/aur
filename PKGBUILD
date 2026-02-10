# Maintainer: Amy <me at he3als dot xyz>

pkgname=bs-manager-bin
pkgver=1.5.6
pkgrel=1
pkgdesc="An all-in-one tool for managing Beat Saber versions, maps, mods, and more (binary release)"
arch=("x86_64")
url="https://github.com/Zagrios/bs-manager"
license=('GPL')
depends=('gtk3' 'nss' 'libxss' 'libxtst' 'libnotify' 'xdg-utils' 'at-spi2-core' 'util-linux')
provides=('bs-manager')
conflicts=('bs-manager' 'bs-manager-git')
source=("bs-manager-${pkgver}.rpm::https://github.com/Zagrios/bs-manager/releases/download/v${pkgver}/bs-manager-${pkgver}.${CARCH}.rpm")
sha256sums=('a02654c940abcf9fce8cf23691089d3d3dcb297d7cc33db5dbc8fce61669e8f1')
options=('!debug')

package() {
    cd "$srcdir"
    install -dm755 "$pkgdir/opt"
    install -dm755 "$pkgdir/usr"
    cp -r opt/BSManager "$pkgdir/opt/"
    cp -r usr/* "$pkgdir/usr/"
}

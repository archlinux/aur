# Maintainer: Robert Schiele <rschiele@gmail.com>

pkgname=openscad-ldraw
pkgver=2025.04
pkgrel=1
pkgdesc="The entire LDraw.org library as OpenSCAD files"
arch=('any')
url="https://github.com/schiele/openscad-ldraw"
license=('CC-BY-4.0')
depends=('openscad')
source=("https://github.com/schiele/openscad-ldraw/archive/refs/tags/v${pkgver/./-}.tar.gz")
sha256sums=('fb19a0ceb018436f04c0ce9b25058921ad8ea5c7d6059d67545e943a0b3559ea')

package() {
    cd ${pkgname}-${pkgver/./-}
    mkdir -p "$pkgdir"/usr/share/openscad/libraries/LDraw
    cp -a *.scad models p parts "$pkgdir"/usr/share/openscad/libraries/LDraw/
    install -D -m644 -t "$pkgdir"/usr/share/doc/$pkgname README.md orig/Readme.txt
    install -D -m644 -t "$pkgdir"/usr/share/licenses/$pkgname orig/CA*.txt
}

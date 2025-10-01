# Maintainer: Robert Schiele <rschiele@gmail.com>

pkgname=openscad-ldraw
pkgver=2025.09
pkgrel=1
pkgdesc="The entire LDraw.org library as OpenSCAD files"
arch=('any')
url="https://github.com/schiele/openscad-ldraw"
license=('CC-BY-4.0')
depends=('openscad')
options=('!strip')
source=("https://github.com/schiele/openscad-ldraw/archive/refs/tags/v${pkgver/./-}.tar.gz")
sha256sums=('84a2e2ce19dd6f622680d1910089fd9e6deb7b1a36fdde1c8e90f0e126bbf7b5')

package() {
    cd ${pkgname}-${pkgver/./-}
    mkdir -p "$pkgdir"/usr/share/openscad/libraries/LDraw
    cp -a *.scad models p parts "$pkgdir"/usr/share/openscad/libraries/LDraw/
    install -D -m644 -t "$pkgdir"/usr/share/doc/$pkgname README.md orig/Readme.txt
    install -D -m644 -t "$pkgdir"/usr/share/licenses/$pkgname orig/CA*.txt
}

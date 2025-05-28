# Maintainer: Robert Schiele <rschiele@gmail.com>

pkgname=openscad-ldraw
pkgver=2025.05
pkgrel=1
pkgdesc="The entire LDraw.org library as OpenSCAD files"
arch=('any')
url="https://github.com/schiele/openscad-ldraw"
license=('CC-BY-4.0')
depends=('openscad')
source=("https://github.com/schiele/openscad-ldraw/archive/refs/tags/v${pkgver/./-}.tar.gz")
sha256sums=('c2513d242afda758811a262529ba2cb0b3f21a1b82c0c138b874b3ed0db52776')

package() {
    cd ${pkgname}-${pkgver/./-}
    mkdir -p "$pkgdir"/usr/share/openscad/libraries/LDraw
    cp -a *.scad models p parts "$pkgdir"/usr/share/openscad/libraries/LDraw/
    install -D -m644 -t "$pkgdir"/usr/share/doc/$pkgname README.md orig/Readme.txt
    install -D -m644 -t "$pkgdir"/usr/share/licenses/$pkgname orig/CA*.txt
}

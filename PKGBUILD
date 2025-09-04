# Maintainer: Robert Schiele <rschiele@gmail.com>

pkgname=openscad-ldraw
pkgver=2025.08
pkgrel=1
pkgdesc="The entire LDraw.org library as OpenSCAD files"
arch=('any')
url="https://github.com/schiele/openscad-ldraw"
license=('CC-BY-4.0')
depends=('openscad')
options=('!strip')
source=("https://github.com/schiele/openscad-ldraw/archive/refs/tags/v${pkgver/./-}.tar.gz")
sha256sums=('11706013b5d79bbdf427f2a1b4a84d0bfe648e49f836f0edfac01e8db34586e7')

package() {
    cd ${pkgname}-${pkgver/./-}
    mkdir -p "$pkgdir"/usr/share/openscad/libraries/LDraw
    cp -a *.scad models p parts "$pkgdir"/usr/share/openscad/libraries/LDraw/
    install -D -m644 -t "$pkgdir"/usr/share/doc/$pkgname README.md orig/Readme.txt
    install -D -m644 -t "$pkgdir"/usr/share/licenses/$pkgname orig/CA*.txt
}

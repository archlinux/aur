# Maintainer: Robert Schiele <rschiele@gmail.com>

pkgname=openscad-ldraw
pkgver=2025.12
pkgrel=1
pkgdesc="The entire LDraw.org library as OpenSCAD files"
arch=('any')
url="https://github.com/schiele/openscad-ldraw"
license=('CC-BY-4.0')
depends=('openscad')
options=('!strip')
source=("https://github.com/schiele/openscad-ldraw/archive/refs/tags/v${pkgver/./-}.tar.gz")
sha256sums=('1c661ad19807fd19bb32022395ec13f786393abd0cea3c20652671ec4a24ef6c')

package() {
    cd ${pkgname}-${pkgver/./-}
    mkdir -p "$pkgdir"/usr/share/openscad/libraries/LDraw
    cp -a *.scad models p parts "$pkgdir"/usr/share/openscad/libraries/LDraw/
    install -D -m644 -t "$pkgdir"/usr/share/doc/$pkgname README.md orig/Readme.txt
    install -D -m644 -t "$pkgdir"/usr/share/licenses/$pkgname orig/CA*.txt
}

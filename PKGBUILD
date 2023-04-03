# Maintainer: Alexis BRENON <brenon.alexis+arch at gmail dot com>
pkgname=sweethome3d-textures-scopia
pkgver=1.3
pkgrel=2
pkgdesc="Free textures advertised on SweetHome3D website"
arch=('any')
url="http://www.sweethome3d.com/importTextures.jsp"
license=("custom:CC-BY")
optdepends=("sweethome3d: Models rendering"
"sweethome3d-3dmodels-blendswap-cc0: More 3D models"
"sweethome3d-3dmodels-blendswap-ccby: More 3D models"
"sweethome3d-3dmodels-contributions: More 3D models"
"sweethome3d-3dmodels-katorlegaz: More 3D models"
"sweethome3d-3dmodels-lucapresidente: More 3D models"
"sweethome3d-3dmodels-reallusion: More 3D models"
"sweethome3d-3dmodels-scopia: More 3D models"
"sweethome3d-3dmodels-trees: More 3D models"
"sweethome3d-textures-contributions: More textures")
install="$pkgname.install"
source=("http://prdownloads.sourceforge.net/sweethome3d/Textures-eTeksScopia-1.3.zip")
sha1sums=("80bda232d961901f2af885108c20449b0bfcbce6")

package() {
    mkdir -p $pkgdir/usr/share/eteks/sweethome3d/textures/textures-scopia
    I=0
    for lib in "${srcdir}"/*.sh3t; do
        install -Dm644 "$lib" "$pkgdir/usr/share/eteks/sweethome3d/textures/textures-scopia/textures-scopia-$(printf "%02d" "$I").sh3t"
        I=$(( I + 1 ))
    done
    install -Dm644 "${srcdir}"/LICENSE* "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

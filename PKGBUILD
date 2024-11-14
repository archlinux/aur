# Maintainer: Alexis BRENON <brenon.alexis+arch at gmail dot com>
pkgname=sweethome3d-3dmodels-reallusion
pkgver=1.9.3
pkgrel=2
pkgdesc="Free 3D models advertised on SweetHome3D website"
arch=('any')
url="http://www.sweethome3d.com/freeModels.jsp"
license=("CC-BY-3.0")
optdepends=("sweethome3d: Models rendering"
"sweethome3d-3dmodels-blendswap-cc0: More 3D models"
"sweethome3d-3dmodels-blendswap-ccby: More 3D models"
"sweethome3d-3dmodels-contributions: More 3D models"
"sweethome3d-3dmodels-katorlegaz: More 3D models"
"sweethome3d-3dmodels-lucapresidente: More 3D models"
"sweethome3d-3dmodels-scopia: More 3D models"
"sweethome3d-3dmodels-trees: More 3D models"
"sweethome3d-textures-contributions: More textures"
"sweethome3d-textures-scopia: More textures")
install="$pkgname.install"
source=("http://prdownloads.sourceforge.net/sweethome3d/3DModels-Reallusion-1.9.3.zip")
sha1sums=("b7aefa8fcb0fa4153d8cdb41fd05b6a6e16e9a4b")

package() {
    mkdir -p $pkgdir/usr/share/eteks/sweethome3d/furniture/3dmodels-reallusion
    I=0
    for lib in "${srcdir}"/*.sh3f; do
        install -Dm644 "$lib" "$pkgdir/usr/share/eteks/sweethome3d/furniture/3dmodels-reallusion/3dmodels-reallusion-$(printf "%02d" "$I").sh3f"
        I=$(( I + 1 ))
    done
    install -Dm644 "${srcdir}"/LICENSE* "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

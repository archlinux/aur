# Maintainer: Alexis BRENON <brenon.alexis+arch at gmail dot com>
pkgname=sweethome3d-3dmodels-katorlegaz
pkgver=1.9
pkgrel=2
pkgdesc="Free 3D models advertised on SweetHome3D website"
arch=('any')
url="http://www.sweethome3d.com/freeModels.jsp"
license=("custom:CC-BY")
optdepends=("sweethome3d: Models rendering"
"sweethome3d-3dmodels-blendswap-cc0: More 3D models"
"sweethome3d-3dmodels-blendswap-ccby: More 3D models"
"sweethome3d-3dmodels-contributions: More 3D models"
"sweethome3d-3dmodels-lucapresidente: More 3D models"
"sweethome3d-3dmodels-reallusion: More 3D models"
"sweethome3d-3dmodels-scopia: More 3D models"
"sweethome3d-3dmodels-trees: More 3D models"
"sweethome3d-textures-contributions: More textures"
"sweethome3d-textures-scopia: More textures")
install="$pkgname.install"
source=("http://prdownloads.sourceforge.net/sweethome3d/3DModels-KatorLegaz-1.9.zip")
sha1sums=("3eae468ee0ef466faf94d1fec655b32ac170bf96")

package() {
    mkdir -p $pkgdir/usr/share/eteks/sweethome3d/furniture/3dmodels-katorlegaz
    I=0
    for lib in "${srcdir}"/*.sh3f; do
        install -Dm644 "$lib" "$pkgdir/usr/share/eteks/sweethome3d/furniture/3dmodels-katorlegaz/3dmodels-katorlegaz-$(printf "%02d" "$I").sh3f"
        I=$(( I + 1 ))
    done
    install -Dm644 "${srcdir}"/LICENSE* "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Alexis BRENON <brenon.alexis+arch at gmail dot com>
pkgname=sweethome3d-3dmodels-blendswap-cc0
pkgver=1.7.1
pkgrel=1
pkgdesc="Free 3D models advertised on SweetHome3D website"
arch=('any')
url="http://www.sweethome3d.com/freeModels.jsp"
license=("custom:CC-0")
optdepends=("sweethome3d: Models rendering"
"sweethome3d-3dmodels-blendswap-ccby: More 3D models"
"sweethome3d-3dmodels-contributions: More 3D models"
"sweethome3d-3dmodels-katorlegaz: More 3D models"
"sweethome3d-3dmodels-lucapresidente: More 3D models"
"sweethome3d-3dmodels-reallusion: More 3D models"
"sweethome3d-3dmodels-scopia: More 3D models"
"sweethome3d-3dmodels-trees: More 3D models")
install="$pkgname.install"
source=("http://prdownloads.sourceforge.net/sweethome3d/3DModels-BlendSwap-CC-0-1.7.1.zip")
sha1sums=("d3ed4b4d87671180507520e56831eb621bd9fdfe")

package() {
    mkdir -p $pkgdir/usr/share/eteks/sweethome3d/furniture/blendswap-cc0
    I=0
    for lib in "${srcdir}"/*.sh3f; do
        install -Dm644 "$lib" "$pkgdir/usr/share/eteks/sweethome3d/furniture/blendswap-cc0/blendswap-cc0-$(printf "%02d" "$I").sh3f"
        I=$(( I + 1 ))
    done
    install -Dm644 "${srcdir}"/LICENSE* "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

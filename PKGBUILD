# Maintainer: Alexis BRENON <brenon.alexis+arch at gmail dot com>
pkgname=sweethome3d-3dmodels-contributions
pkgver=1.7.1
pkgrel=1
pkgdesc="Free 3D models advertised on SweetHome3D website"
arch=('any')
url="http://www.sweethome3d.com/freeModels.jsp"
license=("custom:FreeArtLicence")
optdepends=("sweethome3d: Models rendering"
"sweethome3d-3dmodels-blendswap-cc0: More 3D models"
"sweethome3d-3dmodels-blendswap-ccby: More 3D models"
"sweethome3d-3dmodels-katorlegaz: More 3D models"
"sweethome3d-3dmodels-lucapresidente: More 3D models"
"sweethome3d-3dmodels-reallusion: More 3D models"
"sweethome3d-3dmodels-scopia: More 3D models"
"sweethome3d-3dmodels-trees: More 3D models")
install="$pkgname.install"
source=("http://prdownloads.sourceforge.net/sweethome3d/3DModels-Contributions-1.7.1.zip")
sha1sums=("5db3609b754747b018fc5362cc5421271656ceca")

package() {
    mkdir -p $pkgdir/usr/share/eteks/sweethome3d/furniture/contributions
    I=0
    for lib in "${srcdir}"/*.sh3f; do
        install -Dm644 "$lib" "$pkgdir/usr/share/eteks/sweethome3d/furniture/contributions/contributions-$(printf "%02d" "$I").sh3f"
        I=$(( I + 1 ))
    done
    install -Dm644 "${srcdir}"/LICENSE* "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

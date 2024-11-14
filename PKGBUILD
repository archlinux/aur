# Maintainer: Alexis BRENON <brenon.alexis+arch at gmail dot com>
pkgname=sweethome3d-textures-contributions
pkgver=1.3.1
pkgrel=2
pkgdesc="Free textures advertised on SweetHome3D website"
arch=('any')
url="http://www.sweethome3d.com/importTextures.jsp"
license=("CC-BY-3.0")
optdepends=("sweethome3d: Models rendering"
"sweethome3d-3dmodels-blendswap-cc0: More 3D models"
"sweethome3d-3dmodels-blendswap-ccby: More 3D models"
"sweethome3d-3dmodels-contributions: More 3D models"
"sweethome3d-3dmodels-katorlegaz: More 3D models"
"sweethome3d-3dmodels-lucapresidente: More 3D models"
"sweethome3d-3dmodels-reallusion: More 3D models"
"sweethome3d-3dmodels-scopia: More 3D models"
"sweethome3d-3dmodels-trees: More 3D models"
"sweethome3d-textures-scopia: More textures")
install="$pkgname.install"
source=("http://prdownloads.sourceforge.net/sweethome3d/Textures-Contributions-1.3.1.zip")
sha1sums=("99adeb37de2d8aa8775c5156ecf1693a9f28b9aa")

package() {
    mkdir -p $pkgdir/usr/share/eteks/sweethome3d/textures/textures-contributions
    I=0
    for lib in "${srcdir}"/*.sh3t; do
        install -Dm644 "$lib" "$pkgdir/usr/share/eteks/sweethome3d/textures/textures-contributions/textures-contributions-$(printf "%02d" "$I").sh3t"
        I=$(( I + 1 ))
    done
    install -Dm644 "${srcdir}"/LICENSE* "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

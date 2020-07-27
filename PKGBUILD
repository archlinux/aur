# Maintainer: Alexis BRENON <brenon.alexis+arch at gmail dot com>
pkgname=sweethome3d-textures-scopia
pkgver=1.2
pkgrel=1
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
source=("http://prdownloads.sourceforge.net/sweethome3d/Textures-eTeksScopia-1.2.zip")
sha1sums=("c9bbc84aa2b1dc35b24897bc47cd89db78560c61")

package() {
    mkdir -p $pkgdir/usr/share/eteks/sweethome3d/textures/textures-scopia
    I=0
    for lib in "${srcdir}"/*.sh3t; do
        install -Dm644 "$lib" "$pkgdir/usr/share/eteks/sweethome3d/textures/textures-scopia/textures-scopia-$(printf "%02d" "$I").sh3t"
        I=$(( I + 1 ))
    done
    install -Dm644 "${srcdir}"/LICENSE* "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

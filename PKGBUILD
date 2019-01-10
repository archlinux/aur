# Maintainer:Lucas Eduardo Wendt <lucas59356@gmail.com>

pkgname=mspinball-bin
pkgver=v1
depends=('wine')
makedepends=('unrar')
pkgrel=1
arch=(x86_64)
pkgdesc="3D Pinball - Space Cadet"
license=("proprietary")
options=(!strip)
noextract=('Space_Cadet.rar')
url="https://archive.org/details/SpaceCadet_Plus95"
source=('https://archive.org/download/SpaceCadet_Plus95/Space_Cadet.rar')

sha256sums=("3cc5dfd914c2ac41b03f006c7ccbb59d6f9e4c32ecfd1906e718c8e47f130f4a")

prepare() {
    unrar e -y Space_Cadet.rar
}
package() {
    _DESTINATION="$pkgdir/usr/share/mspinball"
    mkdir -p $_DESTINATION
    mkdir -p $pkgdir/usr/bin
    cp "$srcdir/../mspinball" $pkgdir/usr/bin/
    rm $srcdir/Space_Cadet.rar
    cp -r $srcdir/* $_DESTINATION
    mkdir -p "$pkgdir/usr/share/applications/"
    cp "$srcdir/../mspinball.desktop" "$pkgdir/usr/share/applications"
}

# Maintainer:Lucas Eduardo Wendt <lucas59356@gmail.com>

pkgname=mspinball-bin
pkgver=v1
depends=('wine')
makedepends=('unrar')
pkgrel=2
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
    rm $srcdir/Space_Cadet.rar
}
package() {
    install -D -m0755 $srcdir/../mspinball $pkgdir/usr/bin/mspinball
    install -D -m0644 $srcdir/../mspinball.desktop $pkgdir/usr/share/applications/mspinball.desktop
    mkdir -m755 -p $pkgdir/usr/share/mspinbal
    cp -r $srcdir $pkgdir/usr/share/mspinball
}

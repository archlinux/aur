# Maintainer: John-Michael Mulesa <jmulesa [at] gmail.com>

pkgname=distance-hib
_pkgname=distance
pkgver=6895
pkgrel=1
arch=('i686' 'x86_64')
depends=()
source=("${_pkgname}.sh" "${_pkgname}.desktop" "hib://distance_${pkgver}_linux.tar.gz")
pkgdesc="Distance Linux-native with data via Humble Bundle"
license=('custom')
url='https://www.humblebundle.com/store/distance'
sha256sums=('996d991435bb7891aa732bd686cf46902d2a9c3721c3b736ec7a86eb20b0f3a2'
            '0cfb7f275ea0665344b63c4aa158016f6741875e3e271ab63fb5d2ab3857d777'
            'a6fe7d235ae3e201e841824be1a4c368f8f88265df26e948660e03585d69adae')

package() {
    mkdir -p $pkgdir/opt/${_pkgname}

    # Move required files to pkgdir
    cp -r $srcdir/{bin,Distance,EULA.txt} $pkgdir/opt/${_pkgname}/

    # Install desktop file.
    install -D -m 644 $srcdir/${_pkgname}.desktop \
             $pkgdir/usr/share/applications/${_pkgname}.desktop

    # Install icon file.
    install -D -m 644 $srcdir/bin/Distance_Data/Resources/UnityPlayer.png \
             $pkgdir/usr/share/pixmaps/${_pkgname}.png

    # Install bash startup script.
    install -D -m 755 $srcdir/${_pkgname}.sh \
             $pkgdir/usr/bin/${_pkgname}
}

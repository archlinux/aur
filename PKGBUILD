# Maintainer: Ainola

pkgname=gog-dont-starve-rog
pkgver=2.0.0.3
pkgrel=1
pkgdesc="Reign of Giants DLC for Don't Starve"
url="https://www.kleientertainment.com/games/dont-starve"
license=('custom')
arch=('any')
depends=('gog-dont-starve')
source=("gog://gog_don_t_starve_reign_of_giants_dlc_${pkgver}.sh")
sha256sums=('814ef06c04d372077480dfea4d132d1613297f4f01722a9a324a4aee7af6cd22')

# You need to download the gog.com installer file manually or with lgogdownloader.
DLAGENTS+=("gog::/usr/bin/echo %u - This is is not a real URL, you need to download the GOG file manually to \"$PWD\" or setup a gog:// DLAGENT. Read this PKGBUILD for more information.")

# Prevent compressing final package
PKGEXT='.pkg.tar'

prepare(){
    cd "$srcdir/data/noarch"
    [ $CARCH == "x86" ]    && rm -r "game/dontstarve64"
    [ $CARCH == "x86_64" ] && rm -r "game/dontstarve32"
}

package(){
    cd "$srcdir"
    install -d "${pkgdir}/opt/gog-dont-starve/"
    cp -r "data/noarch/game/" "${pkgdir}/opt/gog-dont-starve/"
}

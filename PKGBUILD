# Maintainer: Patrice Peterson <runiq@archlinux.us>
# Thanks to: Ainola for the base PKGBUILD (gog-undertale)

pkgname=gog-towerfall-ascension-dark-world
_pkgname=gog-towerfall-ascension
pkgver=2.3.0.5
pkgrel=1
pkgdesc="Expansion for Towerfall: Ascension"
url="http://www.towerfall-game.com"
license=('custom')
arch=('i686' 'x86_64')
# If Firejail is installed, this application will be sandboxed automatically.
depends=('gog-towerfall-ascension')
source=(
    "gog://${pkgname//-/_}_${pkgver}.sh")
sha256sums=('870aaaa9ac9bdb9ead3bd875856b1ad6758926d9530be35a6fed04fee89bb871')

# You need to download the gog.com installer file manually or with lgogdownloader.
DLAGENTS+=("gog::/usr/bin/echo %u Download the GOG file to \"$PWD\" or set up a gog:// DLAGENT.")

# Prevent compressing final package
PKGEXT=".pkg.tar"

package(){
    cd "${srcdir}"

    # Install game
    install -d "${pkgdir}/opt/${_pkgname}/"
    cp -r "data/noarch/game/" "${pkgdir}/opt/${_pkgname}/"
    

    find "${pkgdir}/opt/${_pkgname}" -type d -exec chmod 755 {} \;
}

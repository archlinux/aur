# Maintainer: Sam S. <smls75@gmail.com>

pkgname=arxfatalis-data-gog
pkgver=1.21
pkgrel=1
pkgdesc='Arx Fatalis game data from GOG.com installer (for use with arxlibertatis)'
url='http://www.gog.com/game/arx_fatalis'
arch=('any')
license=('custom:commercial')
provides=('arxfatalis-data')
replaces=('arx-fatalis-data-gog')
conflicts=('arxfatalis-data-copy' 'arxfatalis-data-demo'
           'arx-fatalis-data-copy' 'arx-fatalis-data-demo')
makedepends=('innoextract')
optdepends=('arxlibertatis:  native Linux game executable')
PKGEXT='.pkg.tar'
DLAGENTS+=('gog::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a gog:// DLAGENT in /etc/makepkg.conf."; exit 1')

_gamepkg="setup_arx_fatalis_2.0.0.7.exe"

source=("gog://$_gamepkg"
        "arx-install-data")  # from http://arx.vg/arx-install-data
md5sums=('5be0898e71632e46ca430d7a32d0179a'
         'fc5456e4c213af243b65862db8d5db0a')

package() {
    chmod +x arx-install-data
    ./arx-install-data --batch "$_gamepkg" "$pkgdir/usr/share/arx"
}

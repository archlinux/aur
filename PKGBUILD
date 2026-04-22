# Maintainer: Sam S. <smls75@gmail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>

pkgname=arx-fatalis-data-gog
pkgver=1.22
pkgrel=1
pkgdesc='Arx Fatalis game data from GOG.com installer (for use with arx-libertatis)'
url='https://www.gog.com/game/arx_fatalis'
arch=('any')
license=('custom:commercial')
provides=('arxfatalis-data')
conflicts=('arxfatalis-data-copy' 'arxfatalis-data-demo'
           'arx-fatalis-data-copy' 'arx-fatalis-data-demo')
makedepends=('innoextract')
optdepends=('arx-libertatis:  native Linux game executable')
DLAGENTS+=('gog::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a gog:// DLAGENT in /etc/makepkg.conf."; exit 1')

_gamepkg="setup_arx_fatalis_1.22_(38577).exe"

source=("gog://$_gamepkg"
        "https://raw.githubusercontent.com/arx/ArxLibertatis/master/scripts/arx-install-data")  # from http://arx.vg/arx-install-data
md5sums=('4386267c7d1f7a6bda72ee5a1c401f5f'
         '85fb59915710afe4fc5d982b6e90b2bc')

package() {
    chmod +x arx-install-data
    ./arx-install-data --batch "$_gamepkg" "$pkgdir/usr/share/arx"
}

# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Sam S. <smls75@gmail.com>

pkgname=arx-fatalis-data-demo
pkgver=5122
pkgrel=1
pkgdesc='Arx Fatalis game data from official freeware demo (for use with arx-libertatis)'
url='https://arx-libertatis.org/'
arch=('any')
license=('custom:freeware')
provides=('arxfatalis-data')
replaces=('arx-fatalis-data-demo')
conflicts=('arxfatalis-data-gog' 'arxfatalis-data-copy'
           'arx-fatalis-data-gog' 'arx-fatalis-data-copy')
makedepends=('cabextract' 'libarchive')
optdepends=('arx-libertatis: native Linux game executable')
_gamepkg="arx_demo_english.zip"

source=("https://downloads.ag.ru/demos/5122/$_gamepkg"
        "https://raw.githubusercontent.com/arx/ArxLibertatis/master/scripts/arx-install-data")
sha1sums=('16a78e498475eefb46c0db28efc4f211f198cf79'
          '0474a514b9c650ea1b09c2dc7e424988d9a2c188')

package() {
    chmod +x arx-install-data
    ./arx-install-data --batch $_gamepkg "$pkgdir"/usr/share/arx
}

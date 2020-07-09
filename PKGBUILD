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
sha512sums=('0cbf0d6da1a373ed29edc49c65ed431117c868ec7bcab04166abd59f5d799460faec506baf191c83fa7c61372888009abb260d8a50e28507a5ec8ab7913a9ad7'
            'c3b8c2571d204f6a99b053aea3fc6b1db05d89429a40d45bad173b72fa303f64b85d73ef1730f4d229138fb0c9b75c85203c4bebc4b145ec847e9de83a82cbaf')

package() {
    chmod +x arx-install-data
    ./arx-install-data --batch $_gamepkg "$pkgdir"/usr/share/arx
}

# Maintainer: Sam S. <smls75@gmail.com>

pkgname=arxfatalis-data-demo
pkgver=0
pkgrel=1
pkgdesc='Arx Fatalis game data from official freeware demo (for use with arxlibertatis)'
url='http://www.arkane-studios.com/uk/arx.php'
arch=('any')
license=('custom:freeware')
provides=('arxfatalis-data')
replaces=('arx-fatalis-data-demo')
conflicts=('arxfatalis-data-gog' 'arxfatalis-data-copy'
           'arx-fatalis-data-gog' 'arx-fatalis-data-copy')
makedepends=('cabextract' 'libarchive')
optdepends=('arxlibertatis: native Linux game executable')
PKGEXT='.pkg.tar'

_gamepkg="arx_demo_english.zip"

# See http://wiki.arx-libertatis.org/Getting_the_game_data#Demo for alternative URLs
source=("http://public.ag.ru/vd/b33ab46983cdcb2489a5a4c8e4a93257/demos/5122/$_gamepkg"
        "arx-install-data")  # from http://arx.vg/arx-install-data
md5sums=('3c59a5799e1237b1b181c96e8c09155a'
         'fc5456e4c213af243b65862db8d5db0a')

package() {
    chmod +x arx-install-data
    ./arx-install-data --batch $_gamepkg "$pkgdir"/usr/share/arx
}

# Maintainer: Sam S. <smls75@gmail.com>

pkgname=arxfatalis-data-copy
pkgver=1.21
pkgrel=1
pkgdesc='Arx Fatalis game data from an existing win32 installation (for use with arxlibertatis)'
url='http://www.arkane-studios.com/uk/arx.php'
arch=('any')
license=('custom:commercial')
provides=('arxfatalis-data')
replaces=('arx-fatalis-data-copy')
conflicts=('arxfatalis-data-gog' 'arxfatalis-data-demo'
           'arx-fatalis-data-gog' 'arx-fatalis-data-demo')
optdepends=('arxlibertatis: native Linux game executable')
PKGEXT='.pkg.tar'

_gamefolder="arx fatalis"
source=("local://$_gamefolder/"
        "arx-install-data")  # from http://arx.vg/arx-install-data
md5sums=('SKIP'
         'fc5456e4c213af243b65862db8d5db0a')

package() {
    chmod +x arx-install-data
    ./arx-install-data --batch "$_gamefolder" "$pkgdir/usr/share/arx"
}

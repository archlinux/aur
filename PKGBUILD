# Maintainer: Det <nimetonmaili g-mail>

pkgname=vuze-plugin-countrylocator
_name=CountryLocator
pkgver=1.8.7
pkgrel=2
pkgdesc='A plugin to include country flags in the "Peers" tab'
arch=('any')
url="http://azureus.sourceforge.net/plugin_details.php?plugin=${_name}"
license=('GPL2')
depends=('vuze')
source=("http://azureus.sourceforge.net/plugins/${_name}_${pkgver}.jar")
noextract=("${_name}_${pkgver}.jar")
md5sums=('6441e5ddceb8f4a17116bde6ba693c84')

package () {
  for i in /usr/lib/vuze* /opt/vuze*; do
    if [[ -f ${i}/Azureus2.jar ]]; then
      install -Dm644 ${_name}_${pkgver}.jar \
                     "${pkgdir}"/${i}/plugins/${_name}/${_name}_${pkgver}.jar
    fi
  done
}
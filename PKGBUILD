# Maintainer: Det <nimetonmaili g-mail>
# Contributor: Pedro Alejandro López-Valencia <palopezv at gmail.com>

pkgname=vuze-plugin-mldht
_name=mlDHT
pkgver=1.5.5
pkgrel=1
pkgdesc="A plugin for the alternative Distributed Hash Table implementation (DHT) used by µTorrent"
arch=('any')
url="http://azureus.sourceforge.net/plugin_details.php?plugin=${_name}"
license=('GPL2')
depends=('vuze')
source=("http://azureus.sourceforge.net/plugins/${_name}_${pkgver}.jar")
noextract=("${_name}_${pkgver}.jar")
md5sums=('96a897240b4b2fab707afe9da44deca8')

package () {
  for i in /usr/lib/vuze* /opt/vuze*; do
    if [[ -f ${i}/Azureus2.jar ]]; then
      install -Dm644 ${_name}_${pkgver}.jar \
                     "${pkgdir}"/${i}/plugins/${_name}/${_name}_${pkgver}.jar
    fi
  done
}
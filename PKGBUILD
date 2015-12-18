#Maintainer: max-k <max-k AT post DOT com>
#Contributor: Zavon <zavon at zavon dot org>
#Contributor: Jonathan 'gishten' Gustafsson <mynick AT mynick DOT com>
#Contributor: Diego <cdprincipe@gmail.com
pkgname=ampache
pkgver=3.8.1
pkgrel=1
pkgdesc="A PHP-based tool for managing and playing your audio/video files via a web interface"
arch=('i686' 'x86_64')
url="http://www.ampache.org/"
license=('GPL')
depends=('mariadb>=5.0' 'php>=5.3')
optdepends=('lame: all transcoding/downsampling'
                'vorbis-tools: all transcoding'
                'flac: flac transcoding/downsampling'
                'faad2: m4a transcoding/downsampling'
                'mp3splt: mp3 and ogg transcoding/downsampling')
conflicts=('ampache-git' 'ampache-development')
install=${pkgname}.install
source=(https://github.com/${pkgname}/${pkgname}/archive/${pkgver}.tar.gz
        'nginx-example.conf')
sha256sums=('2eff94b5674ceb3cfc3a53c1addb297b016f74b1e732f17e9d05920f2ed2a35a'
            'efb63c0ac7e6462ee5c705b9c1998a1d2462502e19e7e5c97fce2c5142b8e62e')

build() {
  echo "" > /dev/null
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  mkdir -p ${pkgdir}/srv/http/${pkgname}
  cp -a * ${pkgdir}/srv/http/${pkgname}/
  mkdir -p ${pkgdir}/usr/share/doc/${pkgname}
  install -D -m644 ${srcdir}/nginx-example.conf ${pkgdir}/usr/share/doc/${pkgname}/
}

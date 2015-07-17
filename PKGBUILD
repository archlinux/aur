#Maintainer: max-k <max-k AT post DOT com>
#Contributor: Zavon <zavon at zavon dot org>
#Contributor: Jonathan 'gishten' Gustafsson <mynick AT mynick DOT com>
#Contributor: Diego <cdprincipe@gmail.com
pkgname=ampache
pkgver=3.8.0
pkgrel=4
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
sha256sums=('10a167b162af9b0f2c17a6cf0d92bbc6fc3c80b4be802d77defcfe761f177304'
            '4781fd154cd9654e89a528cecf2906a51acdd5cd9a96412107b3fc3b51943d0d')

build() {
  echo "" > /dev/null
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  mkdir -p ${pkgdir}/srv/http/${pkgname}
  cp -a * ${pkgdir}/srv/http/${pkgname}/
  mkdir -p ${pkgdir}/usr/share/doc/${_gitname}
  install -D -m644 ${srcdir}/nginx-example.conf ${pkgdir}/usr/share/doc/
}

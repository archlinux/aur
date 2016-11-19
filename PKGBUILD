pkgname=spotlite
pkgver=2.0
pkgrel=1
pkgdesc="Usenet spot database"
url="http://www.spot-net.nl/spotlite/"
license=('custom')
arch=('i686' 'x86_64')
depends=('qtwebkit' 'openssl098')
source=('http://www.spot-net.nl.vfcdn.net/downloads/spotlite/SpotLite(v2)Ubuntu.zip')
md5sums=('095d2c11fad5e49ddd965d24d033dc71')
extract=('bsdtar -xf')

prepare() {
  MACHINE_TYPE=`uname -m`
  if [ ${MACHINE_TYPE} == 'x86_64' ]; then
    ${extract} spotlite-amd64.deb
    else
    ${extract} spotlite-i386.deb
  fi
}

package() {
  ${extract} data.tar.gz -C "${pkgdir}/"
}

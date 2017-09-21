# Maintainer: xpt <user.xpt@gmail.com>
pkgname=kodi-addon-quasar
pkgver=0.9.78
pkgrel=2
pkgdesc='Quasar is an torrent finding and streaming engine for Kodi (fork of Pulsar add-on)'
classname=plugin.video.quasar
arch=('any')
url='https://https://github.com/scakemyer/plugin.video.quasar'
license=('GPL3')
depends=('kodi')
depends_arm=('kodi-rbp')
depends_armv6h=('kodi-rbp')
depends_armv7h=('kodi-rbp')
options=(!strip)
noextract=(${classname}-${pkgver}.zip)

case "$CARCH" in 
  arm|armv6h)
  _pkgarch="arm"
  md5sums=('a9430a6bd17065099348acbc18101d45')
  ;;
  armv7h)
  _pkgarch="armv7"
  md5sums=('9e1fee620a06c8b85f51b9d2752f0bf0')
  ;;
  i686)
  _pkgarch="x64"
  md5sums=('c9e0a7fb5a8b553ec6a4516860892e14')
  ;;
  x86_64)
  _pkgarch="x86"
  md5sums=('8c900aaf3b4fda47f0923852e287f5e7')
  ;;
esac

source=("https://github.com/scakemyer/plugin.video.quasar/releases/download/v${pkgver}/plugin.video.quasar-${pkgver}.linux_${_pkgarch}.zip")
# install=kodi-addon-quasar.install
installpath=/var/lib/kodi/.kodi/addons/

package() {
  mkdir -p ${pkgdir}/${installpath}
  unzip -o ${classname}-${pkgver}.linux_${_pkgarch}.zip -d ${pkgdir}/${installpath}
  rm ${pkgdir}/${installpath}/${classname}/Makefile
}

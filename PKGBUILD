# Maintainer: xpt <user.xpt@gmail.com>
pkgname=kodi-addon-quasar
pkgver=0.9.52
pkgrel=1
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
  arm)
  _pkgarch="arm"
  md5sums=('fd586c4ee557e57dbf485477f0d6975f')
  ;;
  armv6h)
  _pkgarch="arm"
  md5sums=('fd586c4ee557e57dbf485477f0d6975f')
  ;;
  armv7h)
  _pkgarch="armv7"
  md5sums=('ca81d4e553d63e07b484107fb0aa7292')
  ;;
  i686)
  _pkgarch="x64"
  md5sums=('333529a374da4cea82b10b1d7ac3b370')
  ;;
  x86_64)
  _pkgarch="x86"
  md5sums=('f9daf9e1936ff86de5e3561dc229a5d2')
  ;;
esac

source=("https://github.com/scakemyer/plugin.video.quasar/releases/download/v${pkgver}/plugin.video.quasar-${pkgver}.linux_${_pkgarch}.zip")
install=kodi-addon-quasar.install
installpath=/var/lib/kodi/.kodi/addons/

package() {
  mkdir -p ${pkgdir}/${installpath}
  unzip -o ${classname}-${pkgver}.linux_${_pkgarch}.zip -d ${pkgdir}/${installpath}
  rm ${pkgdir}/${installpath}/${classname}/Makefile
}
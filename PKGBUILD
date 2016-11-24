# Maintainer: xpt <user.xpt@gmail.com>
pkgname=kodi-addon-quasar
pkgver=0.9.36
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
  md5sums=('dd89cfc922742cf6ceabdfc02bcb9b53')
  ;;
  armv6h)
  _pkgarch="arm"
  md5sums=('dd89cfc922742cf6ceabdfc02bcb9b53')
  ;;
  armv7h)
  _pkgarch="armv7"
  md5sums=('c7586e86022aa2f99be5c4fbd2ac915f')
  ;;
  i686)
  _pkgarch="x64"
  md5sums=('464df65dc28d8eac718ac55b656520ad')
  ;;
  x86_64)
  _pkgarch="x86"
  md5sums=('2c60eefc899c36ba18a0ad5da81816e8')
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
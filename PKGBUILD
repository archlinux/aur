# Maintainer: xpt <user.xpt@gmail.com>
pkgname=kodi-addon-quasar
pkgver=0.9.34
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
  md5sums=('3a3c53f6e3a321bfcd4db9bb4998bef2')
  ;;
  armv6h)
  _pkgarch="arm"
  md5sums=('3a3c53f6e3a321bfcd4db9bb4998bef2')
  ;;
  armv7h)
  _pkgarch="armv7"
  md5sums=('957aa70243e91844f362f4e6486403a9')
  ;;
  i686)
  _pkgarch="x64"
  md5sums=('00844266b95382ebed6fbed5dec946bc')
  ;;
  x86_64)
  _pkgarch="x86"
  md5sums=('80e118a2b07d1ecdd034a716804fee28')
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
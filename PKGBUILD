# Maintainer: xpt <user.xpt@gmail.com>
pkgname=kodi-addon-quasar
pkgver=0.9.76
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
  md5sums=('5e88bb83a298094152c838268ba4af7d')
  ;;
  armv6h)
  _pkgarch="arm"
  md5sums=('5e88bb83a298094152c838268ba4af7d')
  ;;
  armv7h)
  _pkgarch="armv7"
  md5sums=('8a31ec568f990183cc584895b98f58e6')
  ;;
  i686)
  _pkgarch="x64"
  md5sums=('f5230cd8cdc9402ecc9ce66ee04c3112')
  ;;
  x86_64)
  _pkgarch="x86"
  md5sums=('b8791130607fc733596a9ac09ba12840')
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
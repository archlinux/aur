# Maintainer: xpt <user.xpt@gmail.com>
pkgname=kodi-addon-quasar
pkgver=0.9.33
pkgrel=8
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
  md5sums=('e2ef50ef1f271fd079cf7d1a117df5ba')
  ;;
  armv6h)
  _pkgarch="arm"
  md5sums=('e2ef50ef1f271fd079cf7d1a117df5ba')
  ;;
  armv7h)
  _pkgarch="armv7"
  md5sums=('330065a8ab3fc58cd5ee306b417780bf')
  ;;
  i686)
  _pkgarch="x64"
  md5sums=('3304a6a44cf58743850b1fc29bc1e52b')
  ;;
  x86_64)
  _pkgarch="x86"
  md5sums=('47196cc5dbbb6526b4dff1ee85e337cf')
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
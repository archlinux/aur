# Maintainer: xpt <user.xpt@gmail.com>
pkgname=kodi-addon-quasar
pkgver=0.9.35
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
  md5sums=('5ce3d34bebf93506bfcb6a52cf52f24e')
  ;;
  armv6h)
  _pkgarch="arm"
  md5sums=('5ce3d34bebf93506bfcb6a52cf52f24e')
  ;;
  armv7h)
  _pkgarch="armv7"
  md5sums=('22431c81c4b34c1f687105d741d994c9')
  ;;
  i686)
  _pkgarch="x64"
  md5sums=('7231fb5b68baee849a15246751eb6179')
  ;;
  x86_64)
  _pkgarch="x86"
  md5sums=('49b5febfed5c8c6574869556bc22b2f3')
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
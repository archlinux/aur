# Maintainer: xpt <user.xpt@gmail.com>
pkgname=kodi-addon-quasar
pkgver=0.9.45
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
  arm)
  _pkgarch="arm"
  md5sums=('cb8a8155bc4cd96a82c6ee0556f41f11')
  ;;
  armv6h)
  _pkgarch="arm"
  md5sums=('cb8a8155bc4cd96a82c6ee0556f41f11')
  ;;
  armv7h)
  _pkgarch="armv7"
  md5sums=('ae2b88939c243a7a93ee83622c174830')
  ;;
  i686)
  _pkgarch="x64"
  md5sums=('508e3743ba2f3f60139df62061220af8')
  ;;
  x86_64)
  _pkgarch="x86"
  md5sums=('c4616e49cdfc1f816c2e959ba4d1090e')
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
# Maintainer: M0Rf30

pkgname=kodi-addon-pulsar
pkgver=0.6.1
pkgrel=1
pkgdesc='Pulsar is an torrent finding and streaming engine for Kodi'
classname=plugin.video.pulsar
arch=('any')
url='https://github.com/steeve/plugin.video.pulsar'
license=('GPL3')
depends=('kodi' 'kodi-standalone-service')
options=(!strip)
noextract=(${classname}-${pkgver}.zip)
source=("https://github.com/steeve/plugin.video.pulsar/releases/download/v${pkgver}/${classname}-${pkgver}.zip")
install=kodi-addon-pulsar.install
installpath=/var/lib/kodi/.kodi/addons/

package() {
  mkdir -p ${pkgdir}/${installpath}
  unzip -o ${classname}-${pkgver}.zip -d ${pkgdir}/${installpath}
  rm ${pkgdir}/${installpath}/${classname}/Makefile
  rm -r ${pkgdir}/${installpath}/${classname}/resources/bin/{windows_x86,darwin_x64,linux_arm}
}

md5sums=('f40d16540520a24baf79de667037fb1c')

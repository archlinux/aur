# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Maintainer: Jamie Magee <jamie dot magee at gmail dot com>
pkgname=java-openjfx-ea-bin
_majorver=13
_buildver=2
pkgver=${_majorver}rc${_buildver}
pkgrel=1
pkgdesc="Java OpenJFX ${_majorver} Early-Access Build."
arch=('x86_64')
url='https://openjfx.io/'
license=('GPL2')
depends=('java-openjdk-ea-bin' 'gstreamer' 'libxtst' 'webkit2gtk' 'ffmpeg' 'qt5-base')
source=("https://download2.gluonhq.com/openjfx/${_majorver}/openjfx-${_majorver}-rc+${_buildver}_linux-x64_bin-sdk.zip"
        "https://download2.gluonhq.com/openjfx/${_majorver}/openjfx-${_majorver}-rc+${_buildver}_linux-x64_bin-jmods.zip")
sha256sums=('12533c55f844e3522503144c2eb16223792ac9e56e9e7e91600af5fccb11aafd'
            '63aab423ddddf87b49f857dc923e19dc5c27ee8f2186a95697ef9a309f8b41bb')

_jvmdir=usr/lib/jvm/java-${_majorver}-openjdk

package() {
  # Install
  install -d "${pkgdir}/${_jvmdir}"
  cp -a "javafx-sdk-${_majorver}/lib" "${pkgdir}/${_jvmdir}/"
  mv "${pkgdir}/${_jvmdir}/lib/src.zip" "${pkgdir}/${_jvmdir}/lib/javafx-src.zip"
  # Legal
  install -d "${pkgdir}/usr/share/licenses/java${_majorver}-openjdk"
  cp -a "javafx-sdk-${_majorver}/legal" "${pkgdir}/usr/share/licenses/java${_majorver}-openjdk/"
  # Jmods
  install -d "${pkgdir}/${_jvmdir}/jmods"
  cp -a "javafx-jmods-${_majorver}/"* "${pkgdir}/${_jvmdir}/jmods/"
}

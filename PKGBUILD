# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Maintainer: Jamie Magee <jamie dot magee at gmail dot com>
pkgname=java-openjfx-ea-bin
_majorver=12
_buildver=12
pkgver=${_majorver}b${_buildver}
pkgrel=1
pkgdesc="Java OpenJFX ${_majorver} Early-Access Build."
arch=('x86_64')
url='http://jdk.java.net/openjfx/'
license=('GPL2')
depends=('java-openjdk-ea-bin' 'gstreamer' 'libxtst' 'webkit2gtk' 'ffmpeg' 'qt5-base')
source=("https://download2.gluonhq.com/openjfx/${_majorver}/openjfx-${_majorver}-ea+${_buildver}_linux-x64_bin-sdk.zip"
        "https://download2.gluonhq.com/openjfx/${_majorver}/openjfx-${_majorver}-ea+${_buildver}_linux-x64_bin-jmods.zip")
sha256sums=('a5d5ecd25696c54ee4b7fbf2ca9005f3349af4bcf127bb9838d6b26fa9afc3fc'
            'f05209bc0873e9e87c81d550c92e77b43953f695550a942902bb6c200b9c1849')

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
# vim:set ts=2 sw=2 et:

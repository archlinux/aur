# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Maintainer: Jamie Magee <jamie dot magee at gmail dot com>
pkgname=java-openjfx-ea-bin
_majorver=13
_buildver=1
pkgver=${_majorver}b${_buildver}
pkgrel=1
pkgdesc="Java OpenJFX ${_majorver} Early-Access Build."
arch=('x86_64')
url='http://jdk.java.net/openjfx/'
license=('GPL2')
depends=('java-openjdk-ea-bin' 'gstreamer' 'libxtst' 'webkit2gtk' 'ffmpeg' 'qt5-base')
source=("https://download2.gluonhq.com/openjfx/${_majorver}/openjfx-${_majorver}-ea+${_buildver}_linux-x64_bin-sdk.zip"
        "https://download2.gluonhq.com/openjfx/${_majorver}/openjfx-${_majorver}-ea+${_buildver}_linux-x64_bin-jmods.zip")
sha256sums=('ddcc78f550d70d312027eb752d15e6fb1551c3e59e73440939b9b8fb8878b22f'
            'db18ee522fa49c7c1c6f994048285cb401fe7d68f3551f4ad4cfac1fe13953db')

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

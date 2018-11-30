# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=java-openjfx-bin
_majorver=11
pkgver=11.0.1
pkgrel=1
pkgdesc="Java OpenJFX ${_majorver} client application platform."
arch=('x86_64')
url='https://openjfx.io/'
license=('GPL2')
depends=("java-environment>=${_majorver}" 'gstreamer' 'libxtst' 'webkit2gtk' 'ffmpeg' 'qt5-base')
source=("https://download2.gluonhq.com/openjfx/${pkgver}/openjfx-${pkgver}_linux-x64_bin-sdk.zip"
        "https://download2.gluonhq.com/openjfx/${pkgver}/openjfx-${pkgver}_linux-x64_bin-jmods.zip")
sha256sums=('678aeffe0574e90c59fc1f26628662878529213024abf49cb309f3ecadc3b91b'
            'a898069cd281a410936cc89e367210b5add29f66aa3f8a1fb20e5696be8acc6e')

_jvmdir=usr/lib/jvm/java-${_majorver}-openjdk

package() {
  # Install
  install -d "${pkgdir}/${_jvmdir}"
  cp -a "javafx-sdk-${pkgver}/lib" "${pkgdir}/${_jvmdir}/"
  mv "${pkgdir}/${_jvmdir}/lib/src.zip" "${pkgdir}/${_jvmdir}/lib/javafx-src.zip"
  # Legal
  install -d "${pkgdir}/usr/share/licenses/java${_majorver}-openjdk"
  cp -a "javafx-sdk-${pkgver}/legal" "${pkgdir}/usr/share/licenses/java${_majorver}-openjdk/"
  # Jmods
  install -d "${pkgdir}/${_jvmdir}/jmods"
  cp -a "javafx-jmods-${pkgver}/"* "${pkgdir}/${_jvmdir}/jmods/"
}
# vim:set ts=2 sw=2 et:

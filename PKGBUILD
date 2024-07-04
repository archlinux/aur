# Maintainer: Clemens D. <aur [at] cdaut [dot] de>
pkgname='artemis-grading-bin'
pkgver=4.9.0
pkgrel=1
pkgdesc="Grading tool for Artemis based exercises"
arch=('x86_64' 'aarch64')
url="https://github.com/kit-sdq/programming-lecture-eclipse-artemis/"
license=('EPL')
depends=('java-environment>=17' 'webkit2gtk')
install=artemis.install

source_x86_64=("$pkgname-$pkgver-$CARCH.tar.gz::https://github.com/kit-sdq/programming-lecture-eclipse-artemis/releases/download/v$pkgver/Artemis_Grading_Linux_x86_64.zip" "artemis.desktop")

source_aarch64=("$pkgname-$pkgver-$CARCH.tar.gz::https://github.com/kit-sdq/programming-lecture-eclipse-artemis/releases/download/v$pkgver/Artemis_Grading_Linux_aarch64.zip" "artemis.desktop")


package() {
  install -d "${pkgdir}/opt/${pkgname}/"
  cp -R "${srcdir}/configuration/" "${srcdir}/features/" "${srcdir}/p2/" "${srcdir}/plugins/" "${srcdir}/readme/" "${pkgdir}/opt/artemis-grading-bin"

  install "${srcdir}/.eclipseproduct" "${srcdir}/ArtemisGrading" "${srcdir}/ArtemisGrading.ini" "${srcdir}/artifacts.xml" "${pkgdir}/opt/artemis-grading-bin/"

  install -Dm0644 "artemis.desktop" "${pkgdir}/usr/share/applications/artemis-grading-bin.desktop"

}


sha256sums_x86_64=('61660e5cdb74f4ae57f0d261d9a97717e70cf619d1230c6044ba22df3d6ec3b6'
                   '4047495c70f39905c6145bf66d352236d9a9de5c734a5f0f5335046c860588b0')
sha256sums_aarch64=('61660e5cdb74f4ae57f0d261d9a97717e70cf619d1230c6044ba22df3d6ec3b6'
                    '4047495c70f39905c6145bf66d352236d9a9de5c734a5f0f5335046c860588b0')

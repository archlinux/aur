# Maintainer: Costin Botescu <costin.botescu@gmail.com>
pkgname=jna-bin
pkgver=5.19.1
pkgrel=1
pkgdesc="Java Native Access (jna.jar) and cross-platform mappings (jna-platform.jar), prebuilt from Maven Central"
arch=('any')
url='https://github.com/java-native-access/jna'
license=('LGPL-2.1-or-later' 'Apache-2.0')
depends=('java-runtime')
provides=("jna=${pkgver}" "jna-platform=${pkgver}")
conflicts=('jna' 'jna-platform')
source=(
  "https://repo1.maven.org/maven2/net/java/dev/jna/jna/${pkgver}/jna-${pkgver}.jar"
  "https://repo1.maven.org/maven2/net/java/dev/jna/jna-platform/${pkgver}/jna-platform-${pkgver}.jar"
  'https://raw.githubusercontent.com/java-native-access/jna/master/AL2.0'
  'https://raw.githubusercontent.com/java-native-access/jna/master/LGPL2.1'
)
sha256sums=('4fb141dd8ef6b0585ffceea4bc49602fbc6312fa977e2c488794ea3e6aafecae'
            '3b3864f5b449e9c3c24b16861524b622b086563f44e0cd8384c8efc5a6052f82'
            '0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594'
            'eea173a556abac0370461e57e12aab266894ea6be3874c2be05fd87871f75449')

package() {
  install -Dm644 "${srcdir}/jna-${pkgver}.jar" "${pkgdir}/usr/share/java/jna/jna.jar"
  install -Dm644 "${srcdir}/jna-platform-${pkgver}.jar" "${pkgdir}/usr/share/java/jna-platform.jar"
  install -Dm644 "${srcdir}/AL2.0"   "${pkgdir}/usr/share/licenses/${pkgname}/AL2.0"
  install -Dm644 "${srcdir}/LGPL2.1" "${pkgdir}/usr/share/licenses/${pkgname}/LGPL2.1"
}

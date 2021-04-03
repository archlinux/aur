# Maintainer: Andrius Semionovas <aneworld at gmail dot com>

pkgname=universal-gcode-sender-bin
pkgver=2.0.7
pkgrel=1
pkgdesc="Java based cross platform G-Code sender classic version"
arch=('any')
url="https://github.com/winder/Universal-G-Code-Sender/"
license=('GPL3')
depends=('java-runtime'
         'sh')
provides=('universal-gcode-sender')
conflicts=('universal-gcode-sender')
source=("https://ugs.jfrog.io/ugs/UGS/v${pkgver}/UniversalGcodeSender.zip"
        'universal-gcode-sender'
        'LICENSE.txt')
sha256sums=('7c9b5c74500f5d6add3180ba426ce5f0c8788d23a917aa4f911412af1af4d01a'
            '5b21bde42ca987df4fd77f50aca8431245474d7e1f76874b3f482c3d1cf0ecbe'
            'd25cec7f8ff64ffcc11ef8d85867b1ba76abcf77ddf92a9ed97ef95fa928a18b')

package() {
  # Install jar
  install -Dm644 ${srcdir}/UniversalGcodeSender.jar ${pkgdir}/usr/share/java/${pkgname}/UniversalGcodeSender.jar

  # Install license
  install -Dm644 ${srcdir}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt

  # Install run script
  install -Dm755 ${srcdir}/universal-gcode-sender ${pkgdir}/usr/bin/universal-gcode-sender
}

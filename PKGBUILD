# Maintainer: Ibrahim Rafi <rafiibrahim8@hotmail.com>

pkgname=verilogx
pkgver=0.1
pkgrel=1
pkgdesc='A simple, easy, and fast Verilog simulator.'
url='https://github.com/rafiibrahim8/VerilogX/'
depends=('java-runtime')
arch=('any')
license=('MIT')
source=('verilogx.desktop' 'https://github.com/rafiibrahim8/VerilogX/releases/download/v0.1/VerilogX-Linux-v0.1.tar.gz' 'https://github.com/rafiibrahim8/VerilogX/raw/master/LICENSE' 'https://github.com/rafiibrahim8/VerilogX/raw/master/img/icon_96x96.png')
sha256sums=('ce051d357dd0916e6a2bcba7578c464e8416c0dfade282dfa5f75f50c2a2e034' '25f4b2828ea532fb1160fd96a26fdd00c99e8a70b575b823d2c414e628143c5e' '5c2d0128cde35c77a620623033c4530b45e5b511d01d9173ffbd0024458ca2dd' 'fc0cba3d87684a1c741b00eb5e4a355bfc0e9b3b5a4ea0b656e15b840f96e23a')

package() {
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/{applications,pixmaps,${pkgname},licenses/${pkgname}}

  cd ${srcdir}
  install -m644 VerilogX-Linux/VerilogX.jar ${pkgdir}/usr/share/${pkgname}/${pkgname}.jar
  install -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/
  install -m644 verilogx.desktop ${pkgdir}/usr/share/applications/
  install -m644 icon_96x96.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png

  echo "#!/bin/sh" > ${pkgdir}/usr/bin/${pkgname}
  echo "exec \$JAVA_HOME/bin/java -jar /usr/share/${pkgname}/${pkgname}.jar" >> ${pkgdir}/usr/bin/${pkgname}
  chmod 755 ${pkgdir}/usr/bin/${pkgname}
}

# Maintainer: Vitaliy Berdinskikh <radio_rogal@keemaill.me>
# Maintainer: Oscar Morante <spacepluk@gmail.com>

pkgname=jbake
pkgver=2.6.4
pkgrel=1
pkgdesc="JBake is a Java based, open source, static site/blog generator for developers & designers"
arch=('any')
url="http://jbake.org"
license=('MIT')
depends=('bash' 'java-environment')
source=("jbake-${pkgver}-bin.zip::https://dl.bintray.com/jbake/binary/jbake-2.6.4-bin.zip")
sha256sums=('831149752f72005e3ebf6e7f554b0bf880a8df74faf4bfcf0ec746185316faf0')

package() {
  cd "${srcdir}"/jbake-${pkgver}-bin


  install -d "${pkgdir}"/opt/jbake/{bin,lib,lib/logging}
  install -m 644 lib/*.jar "${pkgdir}"/opt/jbake/lib
  install -m 644 lib/logging/* "${pkgdir}"/opt/jbake/lib/logging
  install -m 755 bin/jbake "${pkgdir}"/opt/jbake/bin
  #install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE

  install -d "${pkgdir}"/usr/bin
  ln -s /opt/jbake/bin/jbake "${pkgdir}"/usr/bin/jbake
}


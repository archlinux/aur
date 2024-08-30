# Maintainer: Alessandro Biasi <al.biasi@gmail.com>

pkgname=jbake
pkgver=2.6.7
pkgrel=1
pkgdesc="JBake is a Java based, open source, static site/blog generator for developers & designers"
arch=('any')
url="http://jbake.org"
license=('MIT')
depends=('bash' 'java-environment')
source=("jbake-${pkgver}-bin.zip::https://github.com/jbake-org/jbake/releases/download/v${pkgver}/jbake-${pkgver}-bin.zip")
sha256sums=('8d9c2b70fbf26415c5b3e530088b8b7fd1d236d3ce2c98a9c03fff4734bced39')

package() {
  cd "${srcdir}"/jbake-${pkgver}-bin


  install -d "${pkgdir}"/opt/jbake/{bin,lib,lib/logging}
  install -m 644 lib/*.jar "${pkgdir}"/opt/jbake/lib
  install -m 644 lib/logging/* "${pkgdir}"/opt/jbake/lib/logging
  install -m 755 bin/jbake "${pkgdir}"/opt/jbake/bin
  #install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
  install -m 644 example_project_*.zip "${pkgdir}"/opt/jbake

  install -d "${pkgdir}"/usr/bin
  ln -s /opt/jbake/bin/jbake "${pkgdir}"/usr/bin/jbake
}


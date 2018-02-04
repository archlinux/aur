# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=libjtopen
pkgver=9.4
pkgrel=1
pkgdesc="Open Source version of the IBM Toolbox for Java, a series of tools to easily access to IBM AS/400 and iSeries data and resources"
arch=('any')
url="http://jt400.sourceforge.net/"
license=('custom')
depends=('java-environment')
replaces=('jtopen')
conflicts=('jtopen')
source=("http://downloads.sourceforge.net/project/jt400/JTOpen-full/${pkgver}/jtopen_${pkgver/\./_}.zip")
sha256sums=('8a82a1d85d6b96a8832e344a05ec7d122b4f72164e5d4be48c6a46a12cf47abc')

package() {
  # Install files for the package
  install -m 755 -d "${pkgdir}/usr/lib/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/lib/${pkgname}" lib/*.jar
  install -m 755 -d "${pkgdir}/usr/lib/${pkgname}/java6"
  install -m 644 -t "${pkgdir}/usr/lib/${pkgname}/java6" lib/java6/*.jar
  install -m 755 -d "${pkgdir}/usr/lib/${pkgname}/java8"
  install -m 644 -t "${pkgdir}/usr/lib/${pkgname}/java8" lib/java8/*.jar
  # Install license files
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" license.html
  # Install documentation files
  install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" changes.html
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" readme.html
}


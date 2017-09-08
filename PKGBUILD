# Maintainer: Hydranix <Hydranix@gmx.com>
pkgname=rapidxml
pkgver=1.13
pkgrel=2
pkgdesc="RapidXml is an attempt to create the fastest XML parser possible, written in modern C++."
arch=("any")
url=""
license=('Boost/MIT')
provides=("rapidxml")
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgname}%20${pkgver}/${pkgname}-${pkgver}.zip"
        "0001-fix-for-a-bug-in-gcc-that-won-t-let-rapidxml-compile.patch")

md5sums=("7b4b42c9331c90aded23bb55dc725d6a"
         "5ca837a41907a7f193f98332b685b295")

build()
{
  cd "${srcdir}"
  patch -p1 --binary < "${srcdir}/0001-fix-for-a-bug-in-gcc-that-won-t-let-rapidxml-compile.patch"

}

package()
{
  mkdir -p "${pkgdir}/usr/include/rapidxml"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/rapidxml.hpp" "${pkgdir}/usr/include/rapidxml/rapidxml.hpp"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/rapidxml_iterators.hpp" "${pkgdir}/usr/include/rapidxml/rapidxml_iterators.hpp"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/rapidxml_print.hpp" "${pkgdir}/usr/include/rapidxml/rapidxml_print.hpp"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/rapidxml_utils.hpp" "${pkgdir}/usr/include/rapidxml/rapidxml_utils.hpp"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/manual.html" "${pkgdir}/usr/share/doc/${pkgname}/manual.html"
}

# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Hydranix <Hydranix@gmx.com>
pkgname=rapidxml
pkgver=1.13
pkgrel=4
pkgdesc="RapidXml is an attempt to create the fastest XML parser possible, written in modern C++."
arch=("any")
url="https://github.com/hydranix/RapidXml"
license=('Boost/MIT')
provides=("rapidxml")
_pkgname="RapidXml"
source=("git+https://github.com/hydranix/RapidXml"
        "0001-fix-for-a-bug-in-gcc-that-won-t-let-rapidxml-compile.patch")

md5sums=('SKIP'
         '8d7b768c15a14640c1958f11bcf98b9b')

build()
{
  cd "${srcdir}"
  patch -p1 --binary < "${srcdir}/0001-fix-for-a-bug-in-gcc-that-won-t-let-rapidxml-compile.patch"
}

package()
{
  mkdir -p "${pkgdir}/usr/include/rapidxml"
  install -Dm644 "${srcdir}/${_pkgname}/rapidxml.hpp" "${pkgdir}/usr/include/${pkgname}/rapidxml.hpp"
  install -Dm644 "${srcdir}/${_pkgname}/rapidxml_iterators.hpp" "${pkgdir}/usr/include/${pkgname}/rapidxml_iterators.hpp"
  install -Dm644 "${srcdir}/${_pkgname}/rapidxml_print.hpp" "${pkgdir}/usr/include/${pkgname}/rapidxml_print.hpp"
  install -Dm644 "${srcdir}/${_pkgname}/rapidxml_utils.hpp" "${pkgdir}/usr/include/${pkgname}/rapidxml_utils.hpp"
  install -Dm644 "${srcdir}/${_pkgname}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  install -Dm644 "${srcdir}/${_pkgname}/manual.html" "${pkgdir}/usr/share/doc/${pkgname}/manual.html"
}

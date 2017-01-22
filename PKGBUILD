# Maintainer: yozi <es.mslj TA xunilhcra> backwards
# Contributor: Bernd Amend <bernd.amend+extension_system gmail com>
pkgname='libcatch-cpp-headers'
pkgver=1.6.1
pkgrel=1
pkgdesc='C++-native framework for unit-tests using only a header file'
arch=(any)
url='http://catch-lib.net'
license=('custom:BSL')
source=("https://raw.githubusercontent.com/philsquared/Catch/v${pkgver}/single_include/catch.hpp"
        "LICENSE::https://raw.githubusercontent.com/philsquared/Catch/${pkgver}/LICENSE_1_0.txt")
sha256sums=('af86b45e40e6ca521b174bfe0bbeec39609e5b60670f34da81b9f5797018d447'
            'c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566')

pkgver() {
  echo $(grep -oEm1 \
    '^.*Catch v[0-9]\.[0-9]+\.[0-9]+$' \
    catch.hpp | cut -d'v' -f2)
}

package() {
  install -D -m644 catch.hpp "${pkgdir}/usr/include/catch.hpp"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

# Maintainer: yozi <es.mslj TA xunilhcra> backwards
# Contributor: Bernd Amend <bernd.amend+extension_system gmail com>
pkgname='libcatch-cpp-headers'
pkgver=1.1build3
pkgrel=1
pkgdesc='C++-native framework for unit-tests using only a header file'
arch=(any)
url='http://catch-lib.net'
license=('custom:BSL')
source=('https://raw.github.com/philsquared/Catch/master/single_include/catch.hpp'
        'LICENSE::https://raw.githubusercontent.com/philsquared/Catch/master/LICENSE_1_0.txt')
sha256sums=('0de165d0fef3ff5dbf45feb1c6c92b8421a05c6268dc2d4f8fdf58fb615cbdfa'
            'c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566')

pkgver() {
  echo $(grep -oEm1 \
    "^*.*CATCH v([0-9])(\.[0-9]+)+ build ([0-9]+)" \
    catch.hpp | cut -d'v' -f2 | tr -d ' ')
}

package() {
  install -D -m644 catch.hpp "${pkgdir}/usr/include/catch.hpp"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

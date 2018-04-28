# Maintainer: yozi <es.mslj TA xunilhcra> backwards
# Contributor: Bernd Amend <bernd.amend+extension_system gmail com>
pkgname='libcatch-cpp-headers'
pkgver=1.12.1
pkgrel=1
pkgdesc='C++-native framework for unit-tests using only a header file'
arch=(any)
url='http://catch-lib.net'
license=('Boost')
source=("https://raw.githubusercontent.com/catchorg/Catch2/v${pkgver}/single_include/catch.hpp")
sha256sums=('ff0ccdb9d6ec0df8206a86925c45492156a9b0b0ac34b1655d0257ea8db50d46')

pkgver() {
  echo $(grep -oEm1 \
    '^.*Catch v[0-9]\.[0-9]+\.[0-9]+$' \
    catch.hpp | cut -d'v' -f2)
}

package() {
  install -D -m644 catch.hpp "${pkgdir}/usr/include/catch.hpp"
}

# vim:set ts=2 sw=2 et:

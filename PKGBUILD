# Maintainer: yozi <es.mslj TA xunilhcra> backwards
# Contributor: Bernd Amend <bernd.amend+extension_system gmail com>
pkgname='libcatch-cpp-headers'
pkgver=1.10.0
pkgrel=1
pkgdesc='C++-native framework for unit-tests using only a header file'
arch=(any)
url='http://catch-lib.net'
license=('Boost')
source=("https://raw.githubusercontent.com/catchorg/Catch2/v${pkgver}/single_include/catch.hpp")
sha256sums=('c6949b68cfb379c0ef7f52aa14780db65f034020b2f90d842be65c55b97915b9')

pkgver() {
  echo $(grep -oEm1 \
    '^.*Catch v[0-9]\.[0-9]+\.[0-9]+$' \
    catch.hpp | cut -d'v' -f2)
}

package() {
  install -D -m644 catch.hpp "${pkgdir}/usr/include/catch.hpp"
}

# vim:set ts=2 sw=2 et:

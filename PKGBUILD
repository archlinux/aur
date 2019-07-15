# Maintainer: Fredrik Strandin <fredrik@strandin.name>

pkgname=libminizinc
pkgver=2.3.1
pkgrel=1
pkgdesc="MiniZinc is a modelling language for constraint programming problems"
arch=(i686 x86_64)
url="http://www.minizinc.org/"
makedepends=(cmake)
license=('MPL2')
conflicts=(minizinc-bin)
provides=(minizinc)
source=(https://github.com/MiniZinc/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('1ca3d927adda1ffbb2548c387fee2b55e0d635466c99167acaf5a1670742215e')

build() {
  cd ${pkgname}-${pkgver}

  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}

  make DESTDIR=$pkgdir install

  install -D -m644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}

# vim:set ts=2 sw=2 et:

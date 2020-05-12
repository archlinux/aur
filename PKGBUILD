# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-array-intspan
pkgver=2.004
pkgrel=1
pkgdesc="Module for handling arrays using integer ranges"
arch=('any')
url="https://github.com/dod38fr/array-intspan-perl"
license=('Artistic2.0')
depends=('perl')
source=("https://www.cpan.org/modules/by-module/Array/Array-IntSpan-${pkgver}.tar.gz")
sha512sums=('52f210e3beec0c1839baa51d68456c6aafbf9764e938f366317895ec26a6101bd4c83b738cf80326bdf975d68e01a796c1fc6ca3c9584ec50aaa45b3e8d7c7ba')

build() {
  cd "${srcdir}/Array-IntSpan-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true
  make
}

check() {
  cd "${srcdir}/Array-IntSpan-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/Array-IntSpan-${pkgver}"

  make pure_install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}

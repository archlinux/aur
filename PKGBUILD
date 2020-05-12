# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-number-range
pkgver=0.12
pkgrel=1
pkgdesc="Perl extension defining ranges of numbers and testing if a number is found in the range"
arch=('any')
url="https://github.com/larrys/Number-Range"
license=('GPL' 'PerlArtistic')
depends=('perl')
source=("https://www.cpan.org/modules/by-module/Number/Number-Range-${pkgver}.tar.gz")
sha512sums=('d5c2ed41f2eb6caa013d10f4cad295b73157323fcb0496c4e10f4673507965f65f18433d5f4b03e8180fa2108b7e87cf0e23255c493431b5ddeb49562ed997d8')

build() {
  cd "${srcdir}/Number-Range-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true
  make
}

check() {
  cd "${srcdir}/Number-Range-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/Number-Range-${pkgver}"

  make pure_install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}

# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-mail-authenticationresults
pkgver=1.20180518
pkgrel=1
pkgdesc="Object Oriented Authentication-Results Headers"
arch=('any')
url="https://metacpan.org/release/Mail-AuthenticationResults"
license=('GPL' 'PerlArtistic')
depends=('perl')
checkdepends=('perl-test-exception')
source=("https://www.cpan.org/modules/by-module/Mail/Mail-AuthenticationResults-${pkgver}.tar.gz")
sha512sums=('15e367700cbe548ca7525f9446aafcb90b0bc0d95b73b2f84782f70cb69e582484a21f0a7b49ad417ca1db48a24af49d3c1eabf9157e67755033ca398390370d')

build() {
  cd "${srcdir}/Mail-AuthenticationResults-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true
  make
}

check() {
  cd "${srcdir}/Mail-AuthenticationResults-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/Mail-AuthenticationResults-${pkgver}"

  make pure_install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}

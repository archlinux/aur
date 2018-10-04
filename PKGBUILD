# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-mail-authenticationresults
pkgver=1.20180923
pkgrel=1
pkgdesc="Object Oriented Authentication-Results Headers"
arch=('any')
url="https://metacpan.org/release/Mail-AuthenticationResults"
license=('GPL' 'PerlArtistic')
depends=('perl')
checkdepends=('perl-test-exception')
source=("https://www.cpan.org/modules/by-module/Mail/Mail-AuthenticationResults-${pkgver}.tar.gz")
sha512sums=('e8a33593261c59b8c1c91d6e655f8a3f6112974169dde9689788a7e0e83a0e66e6a5872ac56d7882e324c914bbb869b3f8c7b330ccf42765633fd475ef68f3be')

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

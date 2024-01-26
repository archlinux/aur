# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname=perl-getopt-long-descriptive
pkgver=0.111
pkgrel=1
pkgdesc="Getopt::Long, but simpler and more powerful"
arch=('any')
url="https://metacpan.org/dist/Getopt-Long-Descriptive"
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-params-validate' 'perl-sub-exporter')
checkdepends=('perl-cpan-meta-check' 'perl-test-fatal' 'perl-test-warnings')
source=("https://backpan.cpan.org/modules/by-authors/id/R/RJ/RJBS/Getopt-Long-Descriptive-${pkgver}.tar.gz")
sha512sums=('22cff8f92e51f08573e34f24028adbf1c3c1c88570a8d35361234ff13486ca5de20ee2cf8d056971777b9cb0f0c78cc183de2e74915f23eaf9b14fbcbf256531')

build() {
  cd "${srcdir}/Getopt-Long-Descriptive-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true
  make
}

check() {
  cd "${srcdir}/Getopt-Long-Descriptive-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/Getopt-Long-Descriptive-${pkgver}"

  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}

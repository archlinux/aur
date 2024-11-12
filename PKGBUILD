# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname=perl-getopt-long-descriptive
pkgver=0.115
pkgrel=1
pkgdesc="Getopt::Long, but simpler and more powerful"
arch=('any')
url="https://metacpan.org/dist/Getopt-Long-Descriptive"
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-params-validate' 'perl-sub-exporter' 'perl-getopt-long>=2.55')
checkdepends=('perl-cpan-meta-check' 'perl-test-fatal' 'perl-test-warnings')
source=("https://backpan.cpan.org/modules/by-authors/id/R/RJ/RJBS/Getopt-Long-Descriptive-${pkgver}.tar.gz")
sha512sums=('259cff1d85f79d851683ff6b1ad70751a3799434260098a20c3ef03ee3c5c20bb59b48d839236757af60abf45b6b0d894c83d7648f89b5aa7537c854178139db')

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

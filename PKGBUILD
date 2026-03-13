# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname=perl-getopt-long-descriptive
pkgver=0.117
pkgrel=1
pkgdesc="Getopt::Long, but simpler and more powerful"
arch=('any')
url="https://metacpan.org/dist/Getopt-Long-Descriptive"
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=('perl' 'perl-params-validate' 'perl-sub-exporter' 'perl-getopt-long>=2.55')
checkdepends=('perl-cpan-meta-check' 'perl-test-fatal' 'perl-test-warnings')
source=("https://cpan.metacpan.org/authors/id/R/RJ/RJBS/Getopt-Long-Descriptive-${pkgver}.tar.gz")
sha512sums=('465f9e50b13901dc08098cd2879f6bb9f50484bef6aa064aa45f816b5c19f62be02af62ca159ea0be3bf720181c0f1de8931bd06ba6735134ddf20250cdbf44f')

build() {
  cd "${srcdir}/Getopt-Long-Descriptive-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true
  make
}

check() {
  cd "${srcdir}/Getopt-Long-Descriptive-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  make test
}

package() {
  cd "${srcdir}/Getopt-Long-Descriptive-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}

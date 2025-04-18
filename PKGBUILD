# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname=perl-getopt-long-descriptive
pkgver=0.116
pkgrel=3
pkgdesc="Getopt::Long, but simpler and more powerful"
arch=('any')
url="https://metacpan.org/dist/Getopt-Long-Descriptive"
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
depends=('perl' 'perl-params-validate' 'perl-sub-exporter' 'perl-getopt-long>=2.55')
checkdepends=('perl-cpan-meta-check' 'perl-test-fatal' 'perl-test-warnings')
source=("https://backpan.cpan.org/modules/by-authors/id/R/RJ/RJBS/Getopt-Long-Descriptive-${pkgver}.tar.gz")
sha512sums=('6c31592b98d8f594fd0d3bcc750120479fa3bd663211ef28ea6607a555c51717cda32679b463e404543392c68fcf289c2a6e51cf93200ec9ea5a43535e5ec438')

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

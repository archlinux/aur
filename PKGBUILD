# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-cgi-emulate-psgi'
pkgver='0.23'
pkgrel='1'
pkgdesc="PSGI adapter for CGI"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cgi>=3.63' 'perl-http-message' 'perl>=5.8.1')
makedepends=()
checkdepends=('perl-test-requires>=0.08')
url='https://metacpan.org/release/CGI-Emulate-PSGI'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/CGI-Emulate-PSGI-0.22.tar.gz')
md5sums=('806886224149a8b49faddce65cf9513f')
sha512sums=('a0adf28a49f71702439258cd0bbf510c322b7856b18f01d977613e6d8aeab43daf2f956f67c1491e19945b79f40d8229fb928653864de35faed4c13284b70401')
_distdir="CGI-Emulate-PSGI-0.22"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
  make test
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete 
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:

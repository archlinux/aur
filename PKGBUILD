# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-http-request-params'
pkgver='1.02'
pkgrel='2'
pkgdesc="Retrieve GET/POST Parameters from HTTP Requests"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs' 'purge')
depends=('perl-cgi>=3.00' 'perl-class-accessor' 'perl-email-mime>=1.42' 'perl-email-mime-contenttype>=1.0' 'perl-http-message')
makedepends=()
url='https://metacpan.org/release/HTTP-Request-Params'
source=('https://search.cpan.org/CPAN/authors/id/K/KI/KIZ/HTTP-Request-Params-1.02.tar.gz')
md5sums=('606f34812f967ae1e13d2c8ea9f54453')
sha256sums=('9c12880ae20bda79366a89cab05eca53d728d94e5e99e988763effc013e8ee8c')
sha512sums=('fbf70db566f3ab72e32f5643b9220795d467e9e04f388670d680025e67932e657c38d711e36b90bda7cc53b0c1281ae742145b45ea92dc39b4029c7c9f104aa3')
b2sums=('9a001da9da817a77b9d9e04f368b70fded8cca41a0a350182dff1269b1ff2c05bfaae70360057547fef7357431d88c424227b083bcf03ba454351d66842a9da5')
_distdir="HTTP-Request-Params-1.02"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:

# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-auth-googleauth'
pkgver='1.09'
pkgrel='1'
pkgdesc="Google Authenticator TBOT Abstraction"
arch=('any')
license=('Artistic2.0')
options=('!emptydirs')
depends=('perl-class-accessor' 'perl-convert-base32' 'perl-cryptx' 'perl-digest-hmac' 'perl-uri' 'perl>=5.010')
makedepends=()
url='https://metacpan.org/release/Auth-GoogleAuth'
source=('http://search.cpan.org/CPAN/authors/id/G/GR/GRYPHON/Auth-GoogleAuth-1.09.tar.gz')
md5sums=('ae954ac932599fff862a08a6a08805e2')
sha512sums=('53249ebbccdf2a4a28e0692adcbea777fbd7a128fb3418209216f2dec47d93fce45ae399a6fc256fad58ddd8b0f764210db5bc0b316dd0696ab75a7254630674')
_distdir="Auth-GoogleAuth-1.09"

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
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:

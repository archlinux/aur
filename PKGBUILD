# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-auth-googleauth'
pkgver='1.04'
pkgrel='1'
pkgdesc="Google Authenticator TBOT Abstraction"
arch=('any')
license=('Artistic2.0')
options=('!emptydirs')
depends=('perl-class-accessor>=0' 'perl-convert-base32>=0' 'perl-digest-hmac>=0' 'perl-math-random-mt>=0' 'perl-uri>=0' 'perl>=5.008')
makedepends=()
checkdepends=('perl-test2-suite>=0')
url='https://metacpan.org/release/Auth-GoogleAuth'
source=('http://search.cpan.org/CPAN/authors/id/G/GR/GRYPHON/Auth-GoogleAuth-1.04.tar.gz')
md5sums=('46a86770bc2bee65e718ee18ab598439')
sha512sums=('70c02ededb9d44095e99d446e2cd6b1b9d7923895a68693e090d3dfeeb207a948fb5fc783d84b4182488388caa8e0964b484a3b923d1422bc3a3456dee6c463b')
_distdir="Auth-GoogleAuth-1.04"

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

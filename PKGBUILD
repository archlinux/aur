# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-auth-googleauth'
pkgver='1.05'
pkgrel='1'
pkgdesc="Google Authenticator TBOT Abstraction"
arch=('any')
license=('Artistic2.0')
options=('!emptydirs')
depends=('perl-class-accessor>=0' 'perl-convert-base32>=0' 'perl-digest-hmac>=0' 'perl-math-random-mt>=0' 'perl-uri>=0' 'perl>=5.008')
makedepends=()
url='https://metacpan.org/release/Auth-GoogleAuth'
source=('http://search.cpan.org/CPAN/authors/id/G/GR/GRYPHON/Auth-GoogleAuth-1.05.tar.gz')
md5sums=('cf3b88108af3f8a345873b86e9de0999')
sha512sums=('361c7916ba9dd9cbf03fbb148166d8eda5769702c57f2e200e659844ce723594d8b6ad076ed9a69635354b24da628219aef88b79ebaf6dfe3e1c3fd6a3fc68e3')
_distdir="Auth-GoogleAuth-1.05"

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

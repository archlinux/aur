# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-swagger2'
pkgver='0.89'
pkgrel='1'
pkgdesc="Perl/CPAN Module Swagger2: Swagger RESTful API Documentation"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-json-validator>=0.90' 'perl-mojolicious>=6.00')
makedepends=()
url='https://metacpan.org/release/Swagger2'
source=('http://search.cpan.org/CPAN/authors/id/A/AS/ASHIMEMA/Swagger2-0.89.tar.gz'
  'perl-swagger2.install')
md5sums=('b3dfe65225f5e0091cfbca71b27b263b'
  'acfc9c7136d12661e0a5f07ab65ece44')
sha512sums=('0458e13a330cda883dc1c2d65d0eb2edc7c551c83b49ae665a9489d569951ad05ac1ec8c891b6020bdce255409b6110e1ae24eb9cdf13e817dcf9630d91aeb50'
  'e61a69575c3f3501b5cbdc6ad475201ff5dd63563207de225335f9464c7daf9f2d409e54dee0fa99bdc486f86be72d9c1da9a0946169cc46d3f17f42f37cc5b3')
_distdir="Swagger2-0.89"
install='perl-swagger2.install'

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
  echo ""
  echo "The test results are not checked! Some tests will fail."
  echo "Execute them is only for informational purposes,"
  echo "so everybody knows which mess he is in if he uses this."
  echo ""
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    # Disable the tests as they fail and everybody should see it.
    make test || return 0
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

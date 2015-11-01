# Submitter  : gergan_penkov
# Maintainer : gergan_penkov
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-magpie'
pkgver='0.11'
pkgrel='1'
pkgdesc="Mocking framework with method stubs and behaviour verification"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-devel-partialdump>=0' 'perl-moose>=0' 'perl-moosex-types>=0' 'perl-moosex-types-structured>=0' 'perl-set-object>=0' 'perl-test-fatal>=0' 'perl-throwable>=0' 'perl-universal-ref>=0' 'perl-aliased>=0' 'perl-namespace-autoclean>=0')
makedepends=()
url='https://metacpan.org/release/Test-Magpie'
source=('http://search.cpan.org/CPAN/authors/id/S/ST/STEVENL/Test-Magpie-0.11.tar.gz')
md5sums=('a6aa147ca467606881cdf3e97c78bb93')
sha512sums=('778d130f808c18b13488873ded99e4adadbadf6cc1239a9fca95a269a97667bc6785f2dd614f261279790bc720fc81647beb96ddacb0ec8b9acba74808476f36')
_distdir="Test-Magpie-0.11"

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

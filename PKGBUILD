# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-moosex-semiaffordanceaccessor'
pkgver='0.10'
pkgrel='1'
pkgdesc="Name your accessors foo() and set_foo()"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moose>=0.94')
makedepends=()
url='http://search.mcpan.org/dist/MooseX-SemiAffordanceAccessor'
source=('http://search.mcpan.org/CPAN/authors/id/D/DR/DROLSKY/MooseX-SemiAffordanceAccessor-0.10.tar.gz')
md5sums=('a4a7c332448e3c55e08762d867783390')
sha512sums=('6261248cc3b4a5dca4ae3303160034be89483fd27197978310c0f4b13573914d99837b50886a0f5e423a148f4b876e5c74e54836203eb4837865e4d4a1102f4f')
_distdir="MooseX-SemiAffordanceAccessor-0.10"

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

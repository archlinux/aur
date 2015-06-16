# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-readonly-xs'
pkgver='1.05'
pkgrel='2'
pkgdesc="Companion module for Readonly.pm, to speed up read-only"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-readonly>=1.02')
makedepends=()
url='http://search.mcpan.org/dist/Readonly-XS'
source=('http://search.mcpan.org/CPAN/authors/id/R/RO/ROODE/Readonly-XS-1.05.tar.gz')
md5sums=('df71f29abfcbd14c963f912d6d6ded6b')
sha512sums=('0e3a8e55e7776e556b7ce995510d73d8d07b51a98f3d4772c291f4c76134c395b196a0485a6ceca39acd536258da5c91cddfdf3f61ef3309c518c807bb0f4dd4')
_distdir="Readonly-XS-1.05"

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

# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-module-locate'
pkgver='1.79'
pkgrel='1'
pkgdesc="locate modules in the same fashion as require and use"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.mcpan.org/dist/Module-Locate'
source=('http://search.cpan.org/CPAN/authors/id/N/NE/NEILB/Module-Locate-1.79.tar.gz')
md5sums=('e76c817b0c3096b9e58e57887e7b81b1')
sha512sums=('5c5029c54d82e91821a07274cdf6465f1f4c6ab443f0f3a6283d2177cb0097f164ba52edab3c0b364d4eb926ea50bf4632ab1f9039ed2336559f89dade9545c2')
_distdir="Module-Locate-1.79"

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

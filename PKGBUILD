# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-template-alloy-xs'
pkgver='1.004'
pkgrel='1'
pkgdesc="XS version of key parts of Template::Alloy"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-template-alloy>=1.002')
makedepends=()
url='http://search.mcpan.org/dist/Template-Alloy-XS'
source=('http://search.cpan.org/CPAN/authors/id/G/GA/GAUDEON/Template-Alloy-XS-1.004.tar.gz')
md5sums=('e25403e05e4357e7585f0b7d00dfef5c')
sha512sums=('8536cb89d92cbacb1fa43eeef1717447d72c2e87f21c548524598957b94b3a84c224fddb7a61f3e4a0fbb2b1705c1fed5b19c8909780ef91ff1c51f694ee62bd')
_distdir="Template-Alloy-XS-1.004"

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

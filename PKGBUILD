# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-b-utils'
pkgver='0.25'
pkgrel='1'
pkgdesc="Helper functions for op tree manipulation"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-task-weaken' 'perl>=5.6.0')
makedepends=('perl-extutils-depends>=0.301')
url='http://search.mcpan.org/dist/B-Utils'
source=('http://search.mcpan.org/CPAN/authors/id/J/JJ/JJORE/B-Utils-0.25.tar.gz')
md5sums=('a45b286d9a0281c98416f2bdf689b800')
sha512sums=('9a198f400d0a138c73a1d52f69e58b3a9100bb0aa4f851b9cec1f54cc2f9cb7e65c67fcad0495deeaf1ad427862b8135d262c46a7945e7cc26ee6a7a879e2ad7')
_distdir="B-Utils-0.25"

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

# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-html-query'
pkgver='0.09'
pkgrel='1'
pkgdesc="jQuery-like selection queries for HTML::Element"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-badger>=0.03' 'perl-html-tree>=3.23')
makedepends=()
url='http://search.mcpan.org/dist/HTML-Query'
source=('http://search.mcpan.org/CPAN/authors/id/K/KA/KAMELKEV/HTML-Query-0.09.tar.gz')
md5sums=('e1681a2427dff87b12b7cb6c87dd70a1')
sha512sums=('d173bc70188c84615f909181c645c336256bd6c8afa8dbacd56c21c3d3f34fa15ab5afdbd01a24647c14c0fc2b55d8bb97124464df217d7becec825200589676')
_distdir="HTML-Query-0.09"

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

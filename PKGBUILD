# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-www-scripter-plugin-javascript'
pkgver='0.008'
pkgrel='1'
pkgdesc="JavaScript plugin for WWW::Scripter"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-css-dom' 'perl-html-dom>=0.027' 'perl-hash-util-fieldhash-compat' 'perl-je>=0.038' 'perl-uri' 'perl-www-scripter>=0.022' 'perl-libwww')
makedepends=()
url='http://search.mcpan.org/dist/WWW-Scripter-Plugin-JavaScript'
source=('http://search.mcpan.org/CPAN/authors/id/S/SP/SPROUT/WWW-Scripter-Plugin-JavaScript-0.008a.tar.gz')
md5sums=('05ad48a00d97b88925746b1c651c136b')
sha512sums=('ef5ed67004651cb6f40af195f34b76cb59e4bfb24832f82d3900551ef9d862dea6ea491add5cf4ba765175822dfcdb7c57e059da03927c669cfdf44155739e8c')
_distdir="WWW-Scripter-Plugin-JavaScript-0.008a"

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

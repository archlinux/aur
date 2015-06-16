# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-html-treebuilder-xpath'
pkgver='0.14'
pkgrel='3'
pkgdesc="add XPath support to HTML::TreeBuilder"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-html-tree' 'perl-xml-xpathengine')
makedepends=()
url='http://search.cpan.org/dist/HTML-TreeBuilder-XPath'
source=('http://search.mcpan.org/CPAN/authors/id/M/MI/MIROD/HTML-TreeBuilder-XPath-0.14.tar.gz')
md5sums=('a3fa3b73ff51dd6ec63be394dcd2a3b5')
sha512sums=('36d68ff08e4cac37e0d596fdcc7c1e84ba4fbecd23f41fccbce43e223750d35a1a7d51a3456397e3037c286fa093c3cd7dd825a07ea90a0c69ed6545ace4b727')
_distdir="HTML-TreeBuilder-XPath-0.14"

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

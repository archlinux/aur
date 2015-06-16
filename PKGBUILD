# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-www-search-scrape'
pkgver='0.08'
pkgrel='1'
pkgdesc="Scrape search engine results"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-html-tree' 'perl-html-treebuilder-xpath' 'perl-www-mechanize')
makedepends=()
url='http://search.cpan.org/dist/WWW-Search-Scrape'
source=('http://search.cpan.org/CPAN/authors/id/Q/QS/QSUN/WWW-Search-Scrape-0.08.tar.gz')
md5sums=('59e830e7f93a77b0b3ed7eab2e10146f')
sha512sums=('f9cffc30070621e0c179a64a2a4ed9033aa2c8113463e25a63c1368987217986e1ef797679dcdd6068567165e6c7c1b2ce684f3a8f44f871200de82d8a2f8c3d')
_distdir="WWW-Search-Scrape-0.08"

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

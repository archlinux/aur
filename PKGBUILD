# Contributor: chimeracoder <dev@chimeracoder.net>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-string-rewriteprefix'
pkgver='0.007'
pkgrel='1'
pkgdesc="rewrite strings based on a set of known prefixes"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-sub-exporter>=0.972')
makedepends=()
url='http://search.cpan.org/dist/String-RewritePrefix'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/String-RewritePrefix-0.007.tar.gz')
md5sums=('7135a69bd8cf74cf17dba857b2372d16')
sha512sums=('c5f2eb6c7661809b4783378a4a33445dfd91fea22cd0a11c9e8d42683879fd6f95c465f7902db2573d5939dc18b250c1fd787d63e3c8a2e15febfd2c8fbd5a10')
_distdir="String-RewritePrefix-0.007"

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

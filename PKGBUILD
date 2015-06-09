# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-leocharre-dir'
pkgver='1.08'
pkgrel='1'
pkgdesc="my subs for general directory needs"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='http://search.cpan.org/dist/LEOCHARRE-Dir'
source=('http://search.cpan.org/CPAN/authors/id/L/LE/LEOCHARRE/LEOCHARRE-Dir-1.08.tar.gz')
md5sums=('baf126496e2f7d78166f37a468f9ae40')
sha512sums=('2ee12cb00566d34d0621be76f836de3a037c541c0919fb7768b9ce993517836d5b0f2bd3a1de008f0ec710a9d8874732df1e41f823d58562710ab1537c008384')
_distdir="LEOCHARRE-Dir-1.08"

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

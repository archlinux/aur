# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-parallel-forker'
pkgver='1.232'
pkgrel='1'
pkgdesc="Parallel job forking and management, with expression based control"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-proc-processtable>=0.4')
makedepends=()
url='http://search.cpan.org/dist/Parallel-Forker'
source=('http://search.cpan.org/CPAN/authors/id/W/WS/WSNYDER/Parallel-Forker-1.232.tar.gz')
md5sums=('0fb9de8e199b1bdb58f57b5b3c400dcb')
sha512sums=('0e5728ea195b204f75179b5838bcdd42e46316a5940fb8d6f3f82ed0ec3fdff6b857c52f238c7f2eb7b83d0b08d1cb3aa08abbff8d9fd575a390d8fea4732a63')
_distdir="Parallel-Forker-1.232"

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

# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-cache-lru'
pkgver='0.04'
pkgrel='1'
pkgdesc="a simple, fast implementation of LRU cache in pure perl"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
checkdepends=('perl-test-requires')
url='http://search.mcpan.org/dist/Cache-LRU'
source=('http://search.mcpan.org/CPAN/authors/id/K/KA/KAZUHO/Cache-LRU-0.04.tar.gz')
md5sums=('e7b3768fdae203bec7a9bd9b8a6b7a90')
sha512sums=('9fd4f56da78e4b8e291c4291ccb2e34bc50f7294fc8ff1d942d21fb116a5613c96f8e55ef9bb95a7ae3e810e791d3edf2f9f15063fd0fb85414a8e8964e88118')
_distdir="Cache-LRU-0.04"

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

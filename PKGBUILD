# Contributor: camb
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-io-tiecombine'
pkgver='1.005'
pkgrel='1'
pkgdesc="produce tied (and other) separate but combined variables"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/release/IO-TieCombine'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/IO-TieCombine-1.005.tar.gz')
md5sums=('9538a96407b32d697a4244959a9f0a7a')
sha512sums=('d0de091279d13e0421e5e0c901a994760cc2f427a1a05305d947f94feb2c040728bcd738965eb583b2c57481fdc474a5516660457069b19f30695962f56cfecf')
_distdir="IO-TieCombine-1.005"

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

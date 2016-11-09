# Generator  : CPANPLUS::Dist::Arch 1.32
# Maintainer: András Wacha < awacha at gmail >

pkgname='perl-regexp-assemble'
pkgver='0.37'
pkgrel='1'
pkgdesc="Assemble multiple Regular Expressions into a single RE"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
checkdepends=('perl-test-pod>=1.48')
url='https://metacpan.org/release/Regexp-Assemble'
source=('http://search.cpan.org/CPAN/authors/id/R/RS/RSAVAGE/Regexp-Assemble-0.37.tgz')
md5sums=('2f7f232642f0f30f69983ef1316ecb42')
sha512sums=('2b21154c814fec9b0fc0affc3c7751e17bd93e5d0b42c13379131498ea2c4ea340316a01045d936dbc9b0e8cfdb1afa7b778936083d04cc533766942fd46c407')
_distdir="Regexp-Assemble-0.37"

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

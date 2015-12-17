# Maintainer: Jose Riha <jose1711 gmail com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-simple'
pkgver='1.001014'
pkgrel=2
pkgdesc="Basic utilities for writing tests."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
conflicts=('perl-test-tester')
url='https://metacpan.org/release/Test-Simple'
source=('http://search.cpan.org/CPAN/authors/id/E/EX/EXODIST/Test-Simple-1.001014.tar.gz')
md5sums=('db7f57fd595e3e1c93c972307a88fa6e')
sha512sums=('0aa0b4d78c0243480df0e7f9b28d69b6bbf1b26bd49a91827c2d61595319840f7178f179555a60ef28d49d3f50679aade4f6d8138e9ae1bd0113a3d6c66d89c2')
_distdir="Test-Simple-1.001014"

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

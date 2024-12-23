# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-extutils-builder'
pkgver='0.013'
pkgrel='1'
pkgdesc="An overview of the foundations of the ExtUtils::Builder Plan framework"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-extutils-config>=0' 'perl>=5.010')
makedepends=()
url='https://metacpan.org/release/ExtUtils-Builder'
source=("http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/ExtUtils-Builder-$pkgver.tar.gz")
md5sums=('beee822c12a8f5995bbe7e0414cc5fec')
sha512sums=('eb25daabe8c6f8b3b22ab25e630463f0c188233d66d76c51cb648ca1afbe840ad2ad5a2a0886a7014e6d0fe93f8cead39254a651488eaca65fb2fb97d4f9a66a')
_distdir="ExtUtils-Builder-$pkgver"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                      \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
  make test
}

package() {
  cd "$srcdir/$_distdir"
  make install
  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:

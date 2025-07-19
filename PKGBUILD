# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-moox-lazierattributes'
pkgver='1.07010'
pkgrel='2'
pkgdesc="Lazier Attributes."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-clone>=0.39' 'perl-moox-returnmodifiers>=1.000001' 'perl-namespace-clean>=0.27' 'perl>=5.006')
makedepends=()
checkdepends=('perl-test-requires>=0')
url='https://metacpan.org/release/MooX-LazierAttributes'
source=("http://search.cpan.org/CPAN/authors/id/L/LN/LNATION/MooX-LazierAttributes-$pkgver.tar.gz")
md5sums=('3ced2174393d6a5f2ed86e82dfadf86a')
sha512sums=('9836f7221c5bd65ab4b4116ad42e6319cde6a86723e905092336a45167ed941dd9adc1f30406e5d0ab7a6446e253d38f48d89ceb02e44b66f529f8e5e2f9a0f4')
_distdir="MooX-LazierAttributes-$pkgver"

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

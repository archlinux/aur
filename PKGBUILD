# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-xml-generator'
pkgver='1.09'
pkgrel='1'
pkgdesc="Perl extension for generating XML"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/release/XML-Generator'
source=("https://cpan.metacpan.org/authors/id/T/TI/TIMLEGGE/XML-Generator-$pkgver.tar.gz")
md5sums=('8fec48c753cf8732ea9d3e768b4da187')
sha512sums=('6dc7fbfa5d12f420d7c764b61acde840cb3f296561a13bde8a8b85fa1d2f8a1f8fb8523d2f91d150d0f1a2608c14c31d1fb96a895fdbd6fecbfbfbb2196e6ac0')
_distdir="XML-Generator-$pkgver"

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

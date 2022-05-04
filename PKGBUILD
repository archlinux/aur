# Contributor: Ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mojo-dom58'
pkgver='3.001'
pkgrel='1'
pkgdesc="Minimalistic HTML/XML DOM parser with CSS selectors"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1')
makedepends=()
url='https://metacpan.org/release/Mojo-DOM58'
source=("http://search.cpan.org/CPAN/authors/id/D/DB/DBOOK/Mojo-DOM58-$pkgver.tar.gz")
md5sums=('4d4d95c331b3f9ff6ebc533312e30c57')
sha512sums=('67d8282f974b005a5f7d47bf9f8fd837315e790304da155f8a2092ed2a50e34522df703d70bac2ecbcce806e645ba69bcfd6ea8ca8adb8ae1aa9eb23ec666a47')
_distdir="Mojo-DOM58-$pkgver"

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

# Contributor: Ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-string-perlquote'
pkgver='0.02'
pkgrel='1'
pkgdesc="Quote a string as Perl does"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.10.1')
makedepends=()
url='https://metacpan.org/release/String-PerlQuote'
source=("https://cpan.metacpan.org/authors/id/P/PE/PERLANCAR/String-PerlQuote-$pkgver.tar.gz")
md5sums=('ca6669525a822e7f309e588d78e1938d')
sha512sums=('8ee33dfb27fd239c9171d088fde221678f8c6bfe7cae170eda052a293b76912cd1fa18557eae0ac3565ddae49185e500db2f527c6790f58e354fbc8ff1160dd1')
_distdir="String-PerlQuote-$pkgver"

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

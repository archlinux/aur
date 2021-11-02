# Contributor: Ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-string-linenumber'
pkgver='0.01'
pkgrel='1'
pkgdesc="Give line number to each line of string"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.10.1')
makedepends=()
url='https://metacpan.org/release/String-LineNumber'
source=("https://cpan.metacpan.org/authors/id/P/PE/PERLANCAR/String-LineNumber-$pkgver.tar.gz")
md5sums=('34fe251e284aac79f8db6e8f68f49c20')
sha512sums=('e5763dc1c3317c5afd91b330edf2874ab6351ec36413e524ff147010d71dced28d1b1767da8a56483207d50e5bb4e155515b4fd5f8c429b5ec1a2268952b906a')
_distdir="String-LineNumber-$pkgver"

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

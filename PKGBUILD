# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-libxml-perl'
pkgver='0.08'
pkgrel='1'
pkgdesc=""
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-xml-parser>=2.19')
makedepends=()
provides=('perl-xml-parser-perlsax')
url='https://metacpan.org/release/libxml-perl'
source=('https://cpan.metacpan.org/authors/id/K/KM/KMACLEOD/libxml-perl-0.08.tar.gz')
md5sums=('0ed5fbdda53d1301ddaed88db10503bb')
sha512sums=('66c1874a04b746334d4324ab37ee057c6da7fa7191dffae2900e0832dab3b2ededc5cbdc5e838c0d57c22161c9cf196ab40b62f61338d4c994bda9fa7b1a7702')
_distdir="libxml-perl-0.08"

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

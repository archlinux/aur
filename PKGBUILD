# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-devel-size'
pkgver='0.86'
pkgrel='1'
pkgdesc="Perl extension for finding the memory usage of Perl variables"
arch=('i686' 'x86_64')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl>=5.005')
makedepends=()
url='https://metacpan.org/release/Devel-Size'
source=("https://cpan.metacpan.org/authors/id/N/NW/NWCLARK/Devel-Size-$pkgver.tar.gz")
md5sums=('5ae6d50693e0b0af9974e9a089a71ca0')
sha512sums=('a11b890d7f264ff5fad5fc3ba2935bdba6460e13caa41b12dc6e60e9d84bd2afbba0bab46d0e63eb9b8b3ec04374086a40583312cb48d550aa5591e393ced4b5')
_distdir="Devel-Size-$pkgver"

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

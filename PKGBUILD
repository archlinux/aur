# Contributor: Ordoban <gabba.head@gmx.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-extutils-builder'
pkgver='0.019'
pkgrel='1'
pkgdesc="An overview of the foundations of the ExtUtils::Builder Plan framework"
arch=('any')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-extutils-config>=0' 'perl-extutils-helpers>=0.027' 'perl>=5.010')
makedepends=()
url='https://metacpan.org/release/ExtUtils-Builder'
source=("http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/ExtUtils-Builder-$pkgver.tar.gz")
md5sums=('6fdce397ca27db836102d58af1223403')
sha512sums=('a4ee008b67707ebfa06b4f061e6c83a7c71f09f82eaf759cf724db499ecf848b73c246ebb8d28596726e38861b88a9eaa30c3772563364582c05f7682edc59ff')
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
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:

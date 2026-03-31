# Contributor: Ordoban <gabba.head@gmx.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-devel-size'
pkgver='0.87'
pkgrel='1'
pkgdesc="Perl extension for finding the memory usage of Perl variables"
arch=('i686' 'x86_64')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl>=5.005')
makedepends=()
url='https://metacpan.org/release/Devel-Size'
source=("http://search.cpan.org/CPAN/authors/id/N/NW/NWCLARK/Devel-Size-$pkgver.tar.gz")
md5sums=('ee4589a77f854fc582380063dd3d2d0a')
sha512sums=('505d32f513e22be3bd1b4e70aadeb7661d17baf520ff977ccd6bf0570995857c2c435a12d7711c0bdd799216b959b0858ab023834ad81ecd70e657fe05201af5')
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
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:

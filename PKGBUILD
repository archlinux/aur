# Contributor: Ordoban <gabba.head@gmx.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-object-proto'
pkgver='1.00'
pkgrel='1'
pkgdesc="objects with prototype chains"
arch=('any')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl>=5.10.0')
makedepends=()
url='https://metacpan.org/release/Object-Proto'
source=("http://search.cpan.org/CPAN/authors/id/L/LN/LNATION/Object-Proto-$pkgver.tar.gz")
md5sums=('857adbcc88d939cca974487c4db6f21a')
sha512sums=('3f74a600de59f002039c5c6607379b2854b8fe6fd9fd3053e503dbcb0723d5402cbcdb02c1e7a93f34a2d09274670e2950d1763f360179bf2919f6b8fc6801ee')
_distdir="Object-Proto-$pkgver"

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

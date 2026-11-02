# Contributor: Ordoban <gabba.head@gmx.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-shared-arena'
pkgver='0.16'
pkgrel='1'
pkgdesc="memory two processes can both read, without a syscall"
arch=('i686' 'x86_64')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-frozen>=0.07' 'perl-struct-codec>=0.05' 'perl>=5.010')
makedepends=()
url='https://metacpan.org/release/Shared-Arena'
source=("http://search.cpan.org/CPAN/authors/id/L/LN/LNATION/Shared-Arena-$pkgver.tar.gz")
md5sums=('e21e06a5700437bb9fb06c4f1c625cbb')
sha512sums=('d229804b4028712692177ba097518b504d48ce817ce40f67f5d41bb9507d00124a8a3d9671ac2e4b54f7b7e65765700616e7cf8a1e41d90825fa16c9c611c862')
_distdir="Shared-Arena-$pkgver"

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

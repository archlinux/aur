# Contributor: Ordoban <gabba.head@gmx.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-apophis'
pkgver='1.00'
pkgrel='1'
pkgdesc="Content addressable storage with deterministic UUID v5 identifiers"
arch=('i686' 'x86_64')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-horus>=0.04' 'perl>=5.010')
makedepends=()
url='https://metacpan.org/release/Apophis'
source=("http://search.cpan.org/CPAN/authors/id/L/LN/LNATION/Apophis-$pkgver.tar.gz")
md5sums=('1ecc22ac7767f616b4e71d32026dc4f1')
sha512sums=('9fe4bc5dec4812e8465e88751fb9e4d786f19209dde910bec02248cdaebe9a31ed4eb21383cfea5a660961b22bd7b59dba59007eca12a13b952c8f541d242017')
_distdir="Apophis-$pkgver"

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

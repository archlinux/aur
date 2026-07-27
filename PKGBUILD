# Contributor: Ordoban <gabba.head@gmx.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-coerce-types-standard'
pkgver='0.000010'
pkgrel='1'
pkgdesc="Coercing"
arch=('any')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-moo>=2.003002' 'perl-moox-lazierattributes>=1.03' 'perl-type-tiny>=1.002001' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Coerce-Types-Standard'
source=("http://search.cpan.org/CPAN/authors/id/L/LN/LNATION/Coerce-Types-Standard-$pkgver.tar.gz")
md5sums=('d7f4504c776aaf228a74f59fc430ce58')
sha512sums=('592b4d4f944aea04af5c830c704b1ac14e6082f4a6c6e15bcbd37ba7cc75dbd85159b4314b816e9020128d1411bd8598e74042a2ad1350aae591db796c46d008')
_distdir="Coerce-Types-Standard-$pkgver"

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

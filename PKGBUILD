# Contributor: Ordoban <gabba.head@gmx.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-horus'
pkgver='1.00'
pkgrel='1'
pkgdesc="XS UUID/GUID generator supporting all RFC 9562 versions"
arch=('i686' 'x86_64')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('glibc>=2.44+r50+g1848099f063e' 'perl>=5.8.3')
makedepends=()
url='https://metacpan.org/release/Horus'
source=("http://search.cpan.org/CPAN/authors/id/L/LN/LNATION/Horus-$pkgver.tar.gz")
md5sums=('80c00b735bd16108b6f5eb18d6ae91dc')
sha512sums=('7d3cff3b8a9ace84cf3d08409daaedf45411f99837936d0681022a598d42aa2b0ec52d3e6ed440b955e8820e8747c0ddcf25454e8acdc646d16b7fe7f98c66b1')
_distdir="Horus-$pkgver"

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

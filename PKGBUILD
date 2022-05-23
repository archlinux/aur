# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-moox-validatesubs'
pkgver='1.012006'
pkgrel='1'
pkgdesc="Validating sub routines via Type::Tiny."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moo>=0' 'perl-moox-returnmodifiers>=0.09' 'perl-type-tiny>=1.002000' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/MooX-ValidateSubs'
source=("https://cpan.metacpan.org/authors/id/L/LN/LNATION/MooX-ValidateSubs-$pkgver.tar.gz")
md5sums=('86daeed0e93cf38b44fda36511b57a6f')
sha512sums=('5d1e5cfd0b0fff47515bad4d8123b7da0a1d63078e5e64a1c70bef64e8b2ea04b472d62cd555e6ccc781b5a5603e8e915ce1e033f01ed5fecaba93f16a783d29')
_distdir="MooX-ValidateSubs-$pkgver"

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

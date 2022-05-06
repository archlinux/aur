# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-moox-validatesubs'
pkgver='1.012005'
pkgrel='1'
pkgdesc="Validating sub routines via Type::Tiny."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moo>=0' 'perl-moox-returnmodifiers>=0.09' 'perl-type-tiny>=1.002000' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/MooX-ValidateSubs'
source=("https://cpan.metacpan.org/authors/id/L/LN/LNATION/MooX-ValidateSubs-$pkgver.tar.gz")
md5sums=('037837ff18cccf10f4b838141b4569b2')
sha512sums=('6c585c0b6969fac87cd0d9708a1926c2d01e60af86c0ff1104716ed7e9935ca18a93242498ddbda1d1ce32acd82f57ec028dd35118314db3c8911c3171a045b9')
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

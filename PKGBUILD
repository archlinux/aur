# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-moox-validatesubs'
pkgver='1.012008'
pkgrel='1'
pkgdesc="Validating sub routines via Type::Tiny."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moo>=0' 'perl-moox-returnmodifiers>=0.09' 'perl-type-tiny>=1.002000' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/MooX-ValidateSubs'
source=("https://cpan.metacpan.org/authors/id/L/LN/LNATION/MooX-ValidateSubs-$pkgver.tar.gz")
md5sums=('dcbe674f0aae2e85b36ffb0d0ad7feb6')
sha512sums=('651dc3adf62d2519262fb606f556bb81167943e25c0e3b009122d61498fda39f759406885df0b6f4dcfef335f6fa2a311fefd3f7289656afb8e4d13ed22ec86c')
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

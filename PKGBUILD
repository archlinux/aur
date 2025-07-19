# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-moox-validatesubs'
pkgver='1.012010'
pkgrel='2'
pkgdesc="Validating sub routines via Type::Tiny."
arch=('any')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-moo>=0' 'perl-moox-returnmodifiers>=1.000001' 'perl-type-tiny>=1.002000' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/MooX-ValidateSubs'
source=("http://search.cpan.org/CPAN/authors/id/L/LN/LNATION/MooX-ValidateSubs-$pkgver.tar.gz")
md5sums=('0cb3c038b6ee365b0311e62cedbc86a8')
sha512sums=('80e30b77e1ce34f7945c3d8bc938f82832b4a2cdb89b7ab222080e69351eb9bb2ae5bb700c8529e9a3317ef519737c647a1cfc4ca87592824c6d038dabaf6387')
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

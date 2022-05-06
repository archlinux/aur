# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-env'
pkgver='1.086'
pkgrel='1'
pkgdesc="test the environment"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008')
makedepends=()
url='https://metacpan.org/release/Test-Env'
source=("https://cpan.metacpan.org/authors/id/B/BD/BDFOY/Test-Env-$pkgver.tar.gz")
md5sums=('a0338c93a569c86d0bf8f6eb5a38ef61')
sha512sums=('e9fe6c2639420b92d761a31d921f4dfa218afd1d61685a6b0752d5d3db409b2f18ab8ffbcdf8ce3ae16f7d8800ed3766e578821dcfc96f4e4b00f5da9c17c803')
_distdir="Test-Env-$pkgver"

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

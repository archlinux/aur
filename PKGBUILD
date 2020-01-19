# Maintainer : Blair Bonnett <blair dot bonnett at gmail dot com>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname=perl-git-version-compare
pkgver=1.004
pkgrel=1
pkgdesc="Functions to compare Git versions"
_dist=Git-Version-Compare
arch=('any')
license=('PerlArtistic' 'GPL')
options=(purge '!emptydirs')
depends=(perl)
checkdepends=(perl-test-nowarnings)
url="https://metacpan.org/release/$_dist"
source=("https://cpan.metacpan.org/authors/id/B/BO/BOOK/$_dist-$pkgver.tar.gz")
md5sums=('45a69d9f9bd2c13c0679de857d45bb18')
sha256sums=('63e8264ed351cb2371b47852a72366214164b5f3fad9dbd68309c7fc63d06491')

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:

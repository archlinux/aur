# Maintainer: Jonne Haß <me@mrzyx.de>
_author="drolsky"
_perlmod="Courriel"
pkgname=perl-courriel
pkgver=0.35
pkgrel=1
pkgdesc="Courriel - High level email parsing and manipulation"
arch=('any')
url="http://search.cpan.org/~$_author/$_perlmod-$pkgver/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-moose' 'perl-moosex-params-validate'
         'perl-moosex-role-parameterized' 'perl-moosex-strictconstructor'
         'perl-moosex-types' 'perl-moosex-types-common')
options=(!emptydirs)
source=(http://cpan.perl.org/modules/by-authors/id/D/DR/DROLSKY/$_perlmod-$pkgver.tar.gz)
md5sums=('3aead41f2c49fa9063386bcc0fe81702')
build() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make

  ## For packages with Build.PL, do this instead:
  # perl Build.PL installdirs=vendor destdir="$pkgdir/"
  # perl Build
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"

  ## For packages with Build.PL, do this instead:
  # perl Build install
}

# vim:set ts=2 sw=2 et:

# Maintainer: Caleb Maclennan <caleb@alerque.com>
_author=rclamp
_perlmod=Class-Accessor-Lvalue
pkgname=perl-class-accessor-lvalue
pkgver=0.11
pkgrel=1
pkgdesc="This module subclasses Class::Accessor in order to provide lvalue accessor makers."
arch=(any)
url="http://search.cpan.org/~$_author/$_perlmod-$pkgver/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/R/RC/RCLAMP/$_perlmod-$pkgver.tar.gz)
md5sums=(f39c187d5c2b16200f59aaa6d532999d)

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
}

# vim:set ts=2 sw=2 et:

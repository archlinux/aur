# Maintainer: Cedric Girard <girard.cedric@gmail.com>
_author=TOMHRR
_perlmod=Net-IP-XS
pkgname=perl-net-ip-xs
pkgver=0.07
pkgrel=1
pkgdesc="XS implementation of Net::IP"
arch=('i686' 'x86_64')
url="http://search.cpan.org/~$_author/$_perlmod-$pkgver/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'gmp' 'perl-tie-hash-sorted' 'perl-tie-simple' 'perl-math-bigint' 'perl-ip-country')
options=(!emptydirs)
source=(http://cpan.perl.org/modules/by-authors/id/T/TO/$_author/$_perlmod-$pkgver.tar.gz)
md5sums=('cfcbc1fd40e18de64a0c05df5ea37cc4')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make

}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"

}

# vim:set ts=2 sw=2 et:

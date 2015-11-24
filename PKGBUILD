# Maintainer: Cedric Girard <girard.cedric@gmail.com>
_author=TOMHRR
_perlmod=Net-IP-XS
pkgname=perl-net-ip-xs
pkgver=0.16
pkgrel=1
pkgdesc="XS implementation of Net::IP"
arch=('i686' 'x86_64')
url="https://metacpan.org/release/$_perlmod"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-tie-simple' 'perl-math-bigint' 'perl-ip-country' 'perl-io-capture')
options=(!emptydirs)
source=(http://cpan.perl.org/modules/by-authors/id/${_author:0:1}/${_author:0:2}/$_author/$_perlmod-$pkgver.tar.gz)
md5sums=('01e9e5be15b2a643274aadbc1269cbfe')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make

}

check() {
  cd "$srcdir/$_perlmod-$pkgver"
  make test

}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"

}

# vim:set ts=2 sw=2 et:

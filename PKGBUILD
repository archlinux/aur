# Maintainer: Cedric Girard <girard.cedric@gmail.com>
_author=TOMHRR
_perlmod=Net-IP-XS
pkgname=perl-net-ip-xs
pkgver=0.09
pkgrel=1
pkgdesc="XS implementation of Net::IP"
arch=('i686' 'x86_64')
url="http://search.cpan.org/~$_author/$_perlmod-$pkgver/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-tie-simple' 'perl-math-bigint' 'perl-ip-country' 'perl-io-capture')
options=(!emptydirs)
source=(http://cpan.perl.org/modules/by-authors/id/${_author:0:1}/${_author:0:2}/$_author/$_perlmod-$pkgver.tar.gz)
md5sums=('39e690dbefd0da0cc8c914bd253de751')

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

# Maintainer: arvids  <arvids arvids net>

_perlmod=Net-STOMP-Client
pkgname=perl-net-stomp-client
pkgver=2.2
pkgrel=2
pkgdesc="Object oriented client interface to interact with servers supporting STOMP"
arch=('any')
url="http://search.cpan.org/dist/Net-STOMP-Client/"
license=('PerlArtistic')
depends=('perl>=5.10.0' 'perl-no-worries' 'perl-params-validate')
optdepends=('perl-io-socket-ssl: allows using STOMP over SSL' 'perl-messaging-message: allows frame <-> message conversions')
options=('!emptydirs')
source=('http://search.cpan.org/CPAN/authors/id/L/LC/LCONS/Net-STOMP-Client-2.2.tar.gz')
md5sums=('2fffb1ea33b997d0127ea989e6e1e9c4')

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

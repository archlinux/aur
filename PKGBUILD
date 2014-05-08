# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: Eduardo Reveles <me@osiux.ws>

pkgname=perl-net-ping
_cpanname=Net-Ping
_module=Net::Ping
pkgver=2.41
pkgrel=1
pkgdesc="$_module - check a remote host for reachability"
arch=('i686' 'x86_64')
url="https://metacpan.org/release/$_cpanname"
license=('unknown')
source=("http://cpan.metacpan.org/authors/id/S/SM/SMPETERS/${_cpanname}-${pkgver}.tar.gz")
depends=('perl-test')
options=('!emptydirs')
md5sums=('e8e1709d3ec8f697e7aa5ca481b1317a')

build() {
  cd "$srcdir/$_cpanname-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/$_cpanname-$pkgver"
  make test
}

package() {
  cd "$srcdir/$_cpanname-$pkgver"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name '.packlist' -o -name '*.pod' -delete
}

# vim:set ts=2 sw=2 et:

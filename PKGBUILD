# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-net-ping-external
_cpanname=Net-Ping-External
_module=Net::Ping::External
pkgver=0.15
pkgrel=2
pkgdesc="$_module - cross-platform interface to ICMP ping utilities"
arch=("any")
url="https://metacpan.org/release/$_cpanname"
license=("GPL" "PerlArtistic")
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/C/CH/CHORNY/${_cpanname}-${pkgver}.tar.gz")
depends=('iputils')
md5sums=('e58f7e6886872febac88228ef7c94aee')

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

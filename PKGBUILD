# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-net-ping-external
_cpanname=Net-Ping-External
_module=Net::Ping::External
pkgver=0.13
pkgrel=2
pkgdesc="$_module - cross-platform interface to ICMP ping utilities"
arch=("i686" "x86_64")
url="https://metacpan.org/release/$_cpanname"
license=("GPL" "PerlArtistic")
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/C/CH/CHORNY/${_cpanname}-${pkgver}.zip")
depends=('perl' 'iputils')
md5sums=('83710568eb209598a04674b18986b049')

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

# Contributor: Alexander Krylov <kass@tpi.ru>
# Contributor: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-net-netmask
_cpanname=Net-Netmask
_module=Net::Netmask
pkgver=1.9022
pkgrel=1
pkgdesc="Parse, manipulate and lookup IP network blocks."
arch=('any')
url="https://metacpan.org/release/$_cpanname"
license=('GPL' 'PerlArtistic')
depends=()
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/M/MU/MUIR/modules/${_cpanname}-${pkgver}.tar.gz")
md5sums=('67cee41e2214bd0934ff96944b29130c')

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

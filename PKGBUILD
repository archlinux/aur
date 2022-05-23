# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Alexander Krylov <kass@tpi.ru>

pkgname=perl-net-netmask
_cpanname=Net-Netmask
_module=Net::Netmask
pkgver=2.0001
pkgrel=1
pkgdesc="Parse, manipulate and lookup IP network blocks."
arch=('any')
url="https://metacpan.org/release/$_cpanname"
license=('GPL' 'PerlArtistic')
depends=()
checkdepends=('perl-test-useallmodules' 'perl-test2-suite')
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/J/JM/JMASLAK/${_cpanname}-${pkgver}.tar.gz")
md5sums=('4185706d6eb978e59b1ab9e89d1865aa')

build() {
  cd $_cpanname-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd $_cpanname-$pkgver
  make test
}

package() {
  cd $_cpanname-$pkgver
  make install DESTDIR="$pkgdir"
  find "$pkgdir" \( -name '.packlist' -o -name '*.pod' \) -delete
}

# vim:set ts=2 sw=2 et:

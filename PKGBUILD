# Maintainer: Jan-Erik Rediger <badboy at archlinux dot us>

pkgname=perl-net-idn-encode
_cpanname=Net-IDN-Encode
pkgver=2.100
pkgrel=1
pkgdesc="Net::IDN::Encode provides an easy-to-use interface for encoding and decoding Internationalized Domain Names (IDNs)."
arch=('any')
url="http://search.cpan.org/~cfaerber/${_cpanname}/"
license=('GPL')
depends=('perl>=5.10.0')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/C/CF/CFAERBER/${_cpanname}-${pkgver}.tar.gz)
md5sums=('5cd442c6e13631ef72d16bffe1e07a02')

build() {
  cd "$srcdir/${_cpanname}-${pkgver}"
  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/${_cpanname}-${pkgver}"
  make install DESTDIR="$pkgdir/"
}

# vim:set ts=2 sw=2 sts=2 et:

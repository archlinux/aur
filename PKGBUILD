# Maintainer: Jan-Erik Rediger <badboy at archlinux dot us>

pkgname=perl-net-sdp
_cpanname=Net-SDP
pkgver=0.07
pkgrel=2
pkgdesc="Net::SDP is an SDP (Session Description Protocol) parser and generator."
arch=('any')
url="http://search.cpan.org/~njh/${_cpanname}/"
license=('GPL')
depends=('perl>=5.10.0')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/N/NJ/NJH/${_cpanname}-${pkgver}.tar.gz)
md5sums=('bb70cb8ebb7ca57c20ac134ac4499e66')

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

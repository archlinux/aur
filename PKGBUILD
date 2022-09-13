# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname=perl-net-mqtt-simple
pkgver=1.27
pkgrel=1
pkgdesc="Net::MQTT::Simple - Very simple MQTT implementation"
arch=(any)
license=('unknown')
url="https://search.cpan.org/dist/Net-MQTT-Simple/"
depends=('perl')
options=(!emptydirs)
source=(https://search.cpan.org/CPAN/authors/id/J/JU/JUERD/Net-MQTT-Simple-${pkgver}.tar.gz)
sha256sums=('30116701a7eab72e85177701f318f01d732f6e34cd8be40b67717b83bb393db4')

build() {
  cd "$srcdir"/Net-MQTT-Simple-${pkgver}
  yes n | perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir"/Net-MQTT-Simple-${pkgver}
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name perllocal.pod -delete
  find "$pkgdir" -name .packlist -delete
}

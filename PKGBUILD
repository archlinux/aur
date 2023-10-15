# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname=perl-net-mqtt-simple
pkgver=1.29
pkgrel=1
pkgdesc="Net::MQTT::Simple - Very simple MQTT implementation"
arch=(any)
license=('unknown')
url="https://search.cpan.org/dist/Net-MQTT-Simple/"
depends=('perl')
options=(!emptydirs)
source=(https://search.cpan.org/CPAN/authors/id/J/JU/JUERD/Net-MQTT-Simple-${pkgver}.tar.gz)
sha256sums=('de7753a722b7cdab590ba9a0a692dcaf9a045e65e654b79c6a069057bdb89ad2')

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

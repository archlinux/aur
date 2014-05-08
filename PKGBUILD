# Maintainer: Brian BIdulock <bidulock@openss7.org>

pkgname=perl-hardware-sensorparser
_cpanname=Hardware-SensorsParser
pkgver=0.01
pkgrel=1
pkgdesc="Simple parser for Lm-sensors output"
arch=('any')
license=("GPL" "PerlArtistic")
url="http://metacpan.org/dist/Hardware-SensorsParser"
depends=('lm_sensors')
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/D/DA/DAVEGEE/$_cpanname-$pkgver.tar.gz")
md5sums=('0ddbc1b94cab78565f8327300529aa58')

build() {
  cd $_cpanname
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd $_cpanname
  make install DESTDIR=${pkgdir}
}

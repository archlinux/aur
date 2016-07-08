# Maintainer: firegore <admin@firegore.com>
pkgname=perl-log-handler
_cpanname=Log-Handler
pkgver=0.87
pkgrel=2
pkgdesc='Log Handler Module for Bloonix'
arch=('i686' 'x86_64')
license=('GPL')
options=('!emptydirs')
depends=('perl-params-validate')
url="https://metacpan.org/pod/Log::Handler"
source=("https://cpan.metacpan.org/authors/id/B/BL/BLOONIX/Log-Handler-$pkgver.tar.gz")
md5sums=('d5db46455e730e047b4451842d03e141')

build() (
  cd $_cpanname-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
)

check() (
  cd $_cpanname-$pkgver
  make test
)

package() (
  cd $_cpanname-$pkgver
  make install DESTDIR="$pkgdir"
)

# Maintainer: Jérémie Detrey <Jeremie.Detrey@loria.fr>
pkgname=cado-nfs
pkgver=2.2.0
pkgrel=1
pkgdesc="Implementation of the Number Field Sieve (NFS) algorithm for factoring integers"
arch=('i686' 'x86_64')
url="http://cado-nfs.gforge.inria.fr/"
license=('LGPL2')
depends=('gmp' 'python' 'sqlite')
makedepends=('cmake' 'inetutils')
source=("https://gforge.inria.fr/frs/download.php/35401/${pkgname}-${pkgver}.tar.gz")
md5sums=('7215b2542a1fe23a9a4d502d5987e14d')

build() {
  cd "${pkgname}-${pkgver}"
  make PREFIX="/usr"
}

package() {
  cd "${pkgname}-${pkgver}"
  make PREFIX="/usr" DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:

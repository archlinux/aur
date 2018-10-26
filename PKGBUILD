# Maintainer: Jérémie Detrey <Jeremie.Detrey@loria.fr>
pkgname=cado-nfs
pkgver=2.3.0
pkgrel=1
pkgdesc="Implementation of the Number Field Sieve (NFS) algorithm for factoring integers"
arch=('i686' 'x86_64')
url="http://cado-nfs.gforge.inria.fr/"
license=('LGPL2')
depends=('gmp' 'python' 'sqlite')
makedepends=('cmake' 'inetutils')
source=("https://gforge.inria.fr/frs/download.php/37058/${pkgname}-${pkgver}.tar.gz")
md5sums=('7d6288df5209f96d579719046ac4386e')

build() {
  cd "${pkgname}-${pkgver}"
  make PREFIX="/usr"
}

package() {
  cd "${pkgname}-${pkgver}"
  make PREFIX="/usr" DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:

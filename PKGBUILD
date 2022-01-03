# Maintainer: Stanislaw Grams <sjg@fmdx.pl>
pkgname=antpatt
pkgver=1.0.1
pkgrel=1
pkgdesc="Antenna pattern plotting and analysis software."
arch=('x86_64' 'i686')
url="https://github.com/kkonradpl/xdr-gtk"
license=('GPL2')
depends=('gtk2')
provides=('antpatt')
conflicts=('antpatt')
makedepends=('git' 'cmake' 'ninja' 'pkgconf' 'gtk2' 'json-c' 'zlib' 'gsl')
source=("https://github.com/kkonradpl/antpatt/archive/refs/tags/v1.0.1.tar.gz")
sha256sums=('8743c496bf3d97f78bbdc31048bbf657113ba25c46c25cbdebf9acc0958348eb')

build() {
  cd "$srcdir/"
  tar -xvf "v$pkgver.tar.gz"
  cd "$pkgname-$pkgver/build/"
  cmake .. -GNinja -Wall -DCMAKE_INSTALL_PREFIX='/usr'
  ninja
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build/"
  DESTDIR="$pkgdir" ninja install
}

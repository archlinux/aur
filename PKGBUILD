# Maintainer: Mort Yao <soi@mort.ninja>

pkgname=smltojs
pkgver=4.3.9
pkgrel=1
pkgdesc='Standard ML to JavaScript compiler'
url='http://www.smlserver.org/smltojs/'
license=('GPL2')
arch=('i686' 'x86_64')
depends=('gmp')
makedepends=('mlton>=20051202')
source=("https://github.com/melsman/mlkit/archive/mlkit-$pkgver.tar.gz")
md5sums=('8a6d2146c935914ec5ff494d75bab602')

build() {
  cd "mlkit-mlkit-$pkgver"
  ./autobuild
  ./configure --sysconfdir=/etc --prefix=/usr
  make smltojs
  make smltojs_basislibs
}

package() {
  cd "mlkit-mlkit-$pkgver"
  make DESTDIR="$pkgdir" install_smltojs install_smltojs_basislibs
}

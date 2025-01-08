# Maintainer: Hendrik Donner <hendrik.donner@gmx.de>
pkgname=concurrency-kit
pkgver=0.7.2
pkgrel=1
pkgdesc="A library with concurrency related algorithms and data structures in C."
arch=('i686' 'x86_64')
url="http://concurrencykit.org"
source=("${pkgname}.tar.gz::https://github.com/concurrencykit/ck/archive/${pkgver}.tar.gz")
sha256sums=('568ebe0bc1988a23843fce6426602e555b7840bf6714edcdf0ed530214977f1b')
license=('Apache-2.0' 'BSD-2-Clause' '0BSD')
depends=('glibc')
provides=('libck.so')

build() {
  cd "ck-${pkgver}"

  ./configure --prefix=/usr

  make
}

package() {
  cd "ck-${pkgver}"

  make DESTDIR=$pkgdir install

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

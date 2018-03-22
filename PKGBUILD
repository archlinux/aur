# Maintainer: Luca P <meti at lplab.net>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jeffrey 'jf' Lim <jfs.world@gmail.com>

pkgname=tnef
pkgver=1.4.17
pkgrel=2
arch=('x86_64' 'i686')
pkgdesc="Program which operates like tar to unpack the files inside an ms-tnef MIME attachment"
url="https://github.com/verdammelt/tnef"
license=('GPL')
depends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/verdammelt/tnef/archive/$pkgver.tar.gz")
sha256sums=('1dd87ebc0ff32c60ce2bc87362b880dc885525051bf3da55e11492565831c6da')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  [ -x configure ] || autoreconf
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

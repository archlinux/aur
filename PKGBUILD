# Maintainer: Luca P <meti at lplab.net>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jeffrey 'jf' Lim <jfs.world@gmail.com>

pkgname=tnef
pkgver=1.4.18
pkgrel=1
arch=('x86_64' 'i686')
pkgdesc="Program which operates like tar to unpack the files inside an ms-tnef MIME attachment"
url="https://github.com/verdammelt/tnef"
license=('GPL')
depends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/verdammelt/tnef/archive/$pkgver.tar.gz")
sha256sums=('fa56dd08649f51b173017911cae277dc4b2c98211721c2a60708bf1d28839922')

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

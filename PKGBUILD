# Maintainer: Luca P <meti at lplab.net>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jeffrey 'jf' Lim <jfs.world@gmail.com>

pkgname=tnef
pkgver=1.4.16
pkgrel=1
arch=(x86_64)
pkgdesc="Program which operates like tar to unpack the files inside an ms-tnef MIME attachment"
url="https://github.com/verdammelt/tnef"
license=('GPL')
depends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/verdammelt/tnef/archive/$pkgver.tar.gz")
sha256sums=('4181c26f5b73b9d65eff2cce6d60d8a273034884a84686cb34e5c41cb2e9d7bb')

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

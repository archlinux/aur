# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jeffrey 'jf' Lim <jfs.world@gmail.com>

pkgname=tnef
pkgver=1.4.15
pkgrel=1
arch=(x86_64)
pkgdesc="Program which operates like tar to unpack the files inside an ms-tnef MIME attachment"
url="https://github.com/verdammelt/tnef"
license=('GPL')
depends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/verdammelt/tnef/archive/$pkgver.tar.gz")
sha256sums=('ca76ad6d95665549c46f98160f5e4a63903ccf912f5c667727db3304a2978486')

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

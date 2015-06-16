# Maintainer: Jeff Parent <jecxjo@sdf.lonestar.org>
pkgname=onetime
pkgver=1.81
pkgrel=2
epoch=
pkgdesc="an open source encrpyiont program that uses the one-time pad method."
arch=(any)
url="http://red-bean.com/onetime/"
license=('MIT')
depends=(python2)
provides=(onetime)
source=(http://red-bean.com/onetime/$pkgname-$pkgver.tar.gz)
sha256sums=('36a83a83ac9f4018278bf48e868af00f3326b853229fae7e43b38d167e628348')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's/python/python2/' ./onetime
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -d $pkgdir/usr/bin
  install -m 555 onetime $pkgdir/usr/bin
}

# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=simple-icon-theme
pkgver=4
pkgrel=1
pkgdesc='A very simple icon theme'
url='https://github.com/maandree/simple-icon-theme'
arch=(any)
license=('custom:ISC')
depends=(gtk-update-icon-cache)
makedepends=(librsvg)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=(5004dea5b1de1c4286cb378f1f494476db011936d325caa29ae0aa725ecb4534e29997df3b750afbcff4c0d0f115a39d321d1bd0d7b8707ecfacd76d8672d58f)

build () {
	cd "$srcdir/simple-icon-theme-$pkgver"
	make -j all-fast PREFIX=/usr
}

package () {
	cd "$srcdir/simple-icon-theme-$pkgver"
	make install PREFIX=/usr DESTDIR="$pkgdir"
}

# Maintainer: Jax Young <jaxvanyang@gmail.com>
pkgname=sgfc
pkgver=2.0
pkgrel=2
pkgdesc="Smart Game Format Syntax Checker & Converter"
arch=('x86_64')
url="https://bitbucket.org/arnoh/sgfc"
license=('BSC-3-Clause')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://bitbucket.org/arnoh/sgfc/get/c8f75dccedfc92355975ef06458070e96cdf9871.tar.gz")
sha256sums=('0bd31bd2163e370113e3561a6c77669b5740a395e7a949983e30f61429dbd574')

prepare() {
	ln -sf -T arnoh-sgfc-* "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	install -Dt "$pkgdir/usr/bin" src/sgfc
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYING
}

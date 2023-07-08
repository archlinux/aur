# Maintainer: Mees Valkenburg <fluffy@godot.uk.to>
# Contributor: felix <`base64 -d <<< ZmVsaXgudm9uLnNAcG9zdGVvLmRlCg==`>
pkgname=ascii2binary
pkgver=2.14
pkgrel=2
pkgdesc="Convert between textual and binary representations of numbers"
url='https://billposer.org/Software/a2b.html'
arch=(i686 x86_64)
depends=(glibc)
license=(GPL3)
source=("https://www.billposer.org/Software/Downloads/$pkgname-$pkgver.tar.bz2")
sha512sums=(
	'de3773ae53412b8d46b4ca4e2ae1bf8d577f550e97824298b3a9db6504f93c02aa2fb6aac727da8da38825dac90c1483426ce4204c6deba579d4e8b5fd70a881'
)

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make install DESTDIR="$pkgdir"
}

# Maintainer: Roshless <pkg@roshless.com>

pkgname=fup
pkgrel=5
pkgver=1.0.0
pkgdesc="Command line client for gofu"
url="https://git.roshless.me/~roshless/fup"
arch=('x86_64' 'i686')
license=("GPL")
depends=("glibc" "curl")
source=("https://git.roshless.me/roshless/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")

build() {
	cd $pkgname-$pkgver
	make PREFIX="/usr"
}

package() {
	cd $pkgname-$pkgver
	make PREFIX="/usr" DESTDIR="$pkgdir" install
}

sha256sums=('bb2a31d29780b1d92714f80ba9a1624e8f0a1666656492faf47bd8642993e777')

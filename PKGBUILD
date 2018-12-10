# Maintainer: Jonas Witschel <diabonas at gmx dot de>
pkgname=jose
pkgver=10
pkgrel=1
pkgdesc='C-language implementation of Javascript Object Signing and Encryption'
arch=('x86_64')
url='https://github.com/latchset/jose'
license=('APACHE')
depends=('jansson' 'openssl' 'zlib')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.bz2")
sha512sums=('596f71bf7f3ab65164556d8353c07a09283e80ad06f8cbb7b1a9609fe3c95888c94c032ae8d719ed3f3b361cb87188f4683728e649d454056841b8ca47828b9d')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}

# Maintainer: nevadimov
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=hru
pkgver=1.1
pkgrel=0
pkgdesc="Filter that translates latin or cyrillic text into grunt"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://git.sr.ht/~begs/hru"
license=('custom:WTFPL')
depends=('libutf8proc' 'glibc')
makedepends=('scdoc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('8aff9bfdb37c88e89736617882d6fc24436fa911f7680501b41e0c26989b75f8')
build() {
	cd "$pkgname-$pkgver"
	make build
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir" install
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

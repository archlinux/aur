# Maintainer: nevadimov
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=hru
pkgver=1.0
pkgrel=1
pkgdesc="Filter that translates latin or cyrillic text into grunt"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://git.sr.ht/~begs/hru"
license=('custom:WTFPL')
depends=('libutf8proc' 'glibc')
makedepends=('scdoc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('8f2da7447ea23950e151cbd71eefc1f112d1a06acd017d485acbde937b916fea')
build() {
	cd "$pkgname-$pkgver"
	make build DEPS=libutf8proc
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir" install
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=mad
pkgver=3.3
pkgrel=1
pkgdesc="A simple rebar-compatible dependency manager and developer tool with plugins"
arch=(i686 x86_64)
url='http://synrc.com/apps/mad/'
license=('MIT')
makedepends=('erlang-nox')
source=("$pkgname-$pkgver.tar.gz::https://github.com/synrc/mad/archive/$pkgver.tar.gz")
sha256sums=('1ebc0271d90f0a5afaa5c836b865ea2257975339cfb954083874f94958959002')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	install -Dm755 "$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

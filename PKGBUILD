# Maintainer: Pierre Neidhardt <ambrevar@gmail.com>

_pkgname=lua-llthreads2
pkgname=lua51-llthreads2
pkgver=0.1.2
pkgrel=2
pkgdesc="This is full dropin replacement for llthreads library"
arch=("i686" "x86_64")
url="http://github.com/moteus/lua-llthreads2/"
license=("MIT")
makedepends=("luarocks5.1")
depends=("lua51")
source=("http://github.com/moteus/$_pkgname/archive/v$pkgver.tar.gz")
md5sums=("f20833d7a4c7560895b5d9ad2a3c24ae")

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	luarocks-5.1 make --pack-binary-rock "rockspecs/$_pkgname-$pkgver-1.rockspec"
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -Dm755 llthreads2.so "$pkgdir/usr/lib/lua/5.1/llthreads2.so"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

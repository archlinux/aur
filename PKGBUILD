# Maintainer: aulonsal <aulonsal at gmail dot com>
pkgname=outfieldr
pkgver=1.1.1
pkgrel=2
pkgdesc='TLDR client in zig'
arch=('x86_64')
url='https://gitlab.com/ve-nt/outfieldr'
license=('MIT')
makedepends=('git' 'zig')
provides=('tldr')
conflicts=('tldr' 'tealdeer')
source=("git+$url.git#tag=$pkgver")
b2sums=('SKIP')

build() {
	cd "$pkgname"
	zig build --release=safe
}

package() {
	cd "$pkgname"
	DESTDIR="${pkgdir}" zig build install --release=safe
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

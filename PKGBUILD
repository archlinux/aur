# Maintainer: Sijmen J. Mulder <ik@sjmulder.nl>
pkgname=json-yaml
pkgver=1.1.1
pkgrel=1
pkgdesc='Convert JSON to YAML'
arch=(x86_64)
url=https://github.com/sjmulder/$pkgname
license=(BSD)
depends=(glibc yajl libyaml)
source=($pkgname-$pkgver.tar.gz::https://github.com/sjmulder/$pkgname/archive/$pkgver.tar.gz)
sha256sums=(40d5e170ee29f3e27364581d9defd2080a4085359866e7007effae84e9111506)

build() {
	cd $pkgname-$pkgver
	make
}

check() {
	cd $pkgname-$pkgver
	make check
}

package() {
	cd $pkgname-$pkgver
	make install DESTDIR="$pkgdir" PREFIX=/usr MANPREFIX=/usr/share/man
	install -d "$pkgdir/usr/share/licenses/$pkgname"
	install LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/"
}

# Contributor: Evan Oicle <oicleevan@protonmail.com>

pkgname=the-deeps
pkgver=1.2.1
pkgrel=2
pkgdesc="A text-based adventure game written in C++."
arch=('any')
url="https://github.com/oicleevan/the-deeps"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/oicleevan/$pkgname/archive/refs/tags/$pkgver.zip")
sha256sums=('d5a6fe6631f0dadc60fe06d3da6da54cb7792cdd69788b8166a65bb3cf2bc93a')

build() {
	cd "$pkgname-$pkgver/src/libeo"
	make
	cd "../.."
	make
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 -t "$pkgdir/usr/bin" bin/$pkgname
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

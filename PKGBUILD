# Maintainer: Nina <nina@l1f.de>
pkgname=viddy
pkgver=0.3.7
pkgrel=2
pkgdesc="A modern watch command"
arch=('x86_64')
url="https://github.com/sachaos/viddy"
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sachaos/viddy/archive/v${pkgver}.tar.gz")
md5sums=('919004814987266837ce0dcadca9c7c1')

build() {
	cd "$pkgname-$pkgver"
	go build -o "$pkgname" -trimpath -ldflags "-s -w -X main.version=$pkgver"
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "$pkgname" -t "$pkgdir/usr/bin"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

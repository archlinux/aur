# Maintainer: Nina <nina@l1f.de>
pkgname=viddy
pkgver=0.2.1
pkgrel=1
pkgdesc="A modern watch command"
arch=('x86_64')
url="https://github.com/sachaos/viddy"
license=('MIT')
makedepends=('go')
updpkgsums=('0488e7bfd23f9d15d5cea55fb827d3cb')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sachaos/viddy/archive/v${pkgver}.tar.gz")
md5sums=('46b6f00ab8d7b30fb641f4d52bad2c4f')

build() {
	cd "$pkgname-$pkgver"
	go build -o "$pkgname" -ldflags "-s -w -X main.version=$pkgver"
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "$pkgname" -t "$pkgdir/usr/bin"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

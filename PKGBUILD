# Maintainer: Nina <nina@l1f.de>
pkgname=viddy
pkgver=0.1.4
pkgrel=1
pkgdesc="A modern watch command"
arch=('x86_64')
url="https://github.com/sachaos/viddy"
license=('MIT')
makedepends=('go')
updpkgsums=('2959d5c2a214b81d665f52b6224df280')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sachaos/viddy/archive/v${pkgver}.tar.gz")
md5sums=('c8173bd520f4068cf4cf684e310c77b6')

build() {
	cd "$pkgname-$pkgver"
	go build -o "$pkgname" -ldflags '-s -w -X main.version="$pkgver"'
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "$pkgname" -t "$pkgdir/usr/bin"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

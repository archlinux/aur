# Maintainer: Nina <nina@l1f.de>
pkgname=viddy
pkgver=0.4.0
pkgrel=2
pkgdesc="A modern watch command"
arch=('x86_64')
url="https://github.com/sachaos/viddy"
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sachaos/viddy/archive/v${pkgver}.tar.gz")
md5sums=('9ca24c4035d7d9ea7add86e3617ccba0')

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

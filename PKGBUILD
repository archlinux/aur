# Maintainer: Nina <nina@l1f.de>
pkgname=viddy
pkgver=0.3.1
pkgrel=1
pkgdesc="A modern watch command"
arch=('x86_64')
url="https://github.com/sachaos/viddy"
license=('MIT')
makedepends=('go')
updpkgsums=('bf47b102e8ff0fc78f505731b1162141')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sachaos/viddy/archive/v${pkgver}.tar.gz")
md5sums=('1904a140bd3b30ed8497b9ff1550983d')

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

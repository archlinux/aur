# Maintainer: Nina <nina@l1f.de>
pkgname=viddy
pkgver=0.1.5
pkgrel=1
pkgdesc="A modern watch command"
arch=('x86_64')
url="https://github.com/sachaos/viddy"
license=('MIT')
makedepends=('go')
updpkgsums=('2959d5c2a214b81d665f52b6224df280')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sachaos/viddy/archive/v${pkgver}.tar.gz")
md5sums=('976d833fc8e66d07f814fd0b08ea0093')

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

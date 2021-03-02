# Maintainer: Brad Erhart <brae dot 04 plus aur at gmail dot com>

pkgname=flarectl
_pkgname=cloudflare-go
pkgver=0.13.8
pkgrel=2
pkgdesc='CLI application for interacting with a Cloudflare account'
arch=('x86_64')
url="https://github.com/cloudflare/cloudflare-go/tree/v${pkgver}/cmd/flarectl"
license=('BSD')
makedepends=('go-pie')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/cloudflare/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=(a9b599b1bcb190e75c294cc96fe8b476c88dae06f3aad046a388e0c15ab8e149)

build() {
	cd "$_pkgname-$pkgver/cmd/$pkgname" \
	&& go mod tidy \
	&& go build -trimpath
}

package() {
	install -Dm 755 "$_pkgname-$pkgver/cmd/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# Maintainer: Brad Erhart <brae dot 04 plus aur at gmail dot com>

pkgname=flarectl
_pkgname=cloudflare-go
pkgver=0.13.5
pkgrel=1
pkgdesc='CLI application for interacting with a Cloudflare account'
arch=('x86_64')
url="https://github.com/cloudflare/cloudflare-go/tree/v${pkgver}/cmd/flarectl"
license=('BSD')
makedepends=('go-pie')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/cloudflare/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=(88f0519c2805cd4ca4bee4272040081663525d6d308741c6ec3a5005693eeca4)

build() {
	cd "$_pkgname-$pkgver/cmd/$pkgname"
	go build \
		-trimpath \
		-ldflags "-extldflags $LDFLAGS"
}

package() {
	install -Dm 755 "$_pkgname-$pkgver/cmd/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

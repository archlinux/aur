# Maintainer: Per Osbeck <per@osbeck.com>
pkgname=globalping-cli
pkgver=0.4.0
pkgrel=1
pkgdesc="Better understand your network routing, fix anycast issues, monitor your CDN and DNS performance, do uptime monitoring and build your own network tools for personal or public use."
arch=(x86_64)
url="https://github.com/jsdelivr/globalping"
license=('Mozilla Public License 2.0')
makedepends=('git' 'go')
source=("$pkgname::git+https://github.com/jsdelivr/$pkgname.git#tag=v$pkgver")
sha256sums=(SKIP)

build() {
	cd "$pkgname"
	GOPATH="$srcdir" go build
}

package() {
	pwd
	install -Dm755 "$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# Maintainer: Jon Gjengset <jon@tsp.io>

pkgname=goconvey
pkgver=1.5.0.r392.g68c2220
pkgrel=1
pkgdesc="Go testing in the browser that integrates with go test"
arch=('x86_64' 'i686')
url="http://goconvey.co/"
license=('MIT')
makedepends=('go')
options=('!strip' '!emptydirs')
source=()
sha256sums=()

pkgver() {
	mkdir -p src bin pkg
	GOPATH=$(pwd) go get github.com/smartystreets/goconvey
	cd src/github.com/smartystreets/goconvey
	git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
	install -Dm755 "$srcdir/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$srcdir/src/github.com/smartystreets/goconvey/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Julian Flake <flake at uni-koblenz dot de>

pkgname=ttnctl
pkgver=2.10.4dev
pkgrel=1
pkgdesc="The Things Network CLI"
arch=(x86_64)
url="https://github.com/TheThingsNetwork/ttn/tree/master/ttnctl"
license=('MIT')
provides=("$pkgname" "$pkgname-linux-amd64")
source=(
	"https://ttnreleases.blob.core.windows.net/release/master/$pkgname-linux-amd64.tar.gz"
	"https://github.com/TheThingsNetwork/ttn/raw/develop/LICENSE"
)
md5sums=(
	"0d5d946317d93bddb5b0860cd8793030"
	"a77e15a2ad23e13f5a142493ad0c73b7"
)

pkgver() {
	# didn't get it in one sed expression
	$srcdir/ttnctl-linux-amd64 version | grep Version | sed -E 's/.*Version.*=v(.*)[[:blank:]]?.*/\1/g' | sed 's/-dev/dev/'
}

package() {
	install -Dm755 $pkgname-linux-amd64 $pkgdir/usr/bin/ttnctl
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

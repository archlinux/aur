# Maintainer: Julian Flake <flake at uni-koblenz dot de>

pkgname=ttnctl
pkgver=2.10.4dev
pkgrel=1
pkgdesc="The Things Network CLI"
arch=(x86_64)
url="https://github.com/TheThingsNetwork/ttn/tree/master/ttnctl"
license=('MIT')
provides=("$pkgname" "$pkgname-linux-amd64")
source=("https://ttnreleases.blob.core.windows.net/release/master/$pkgname-linux-amd64.tar.gz")
md5sums=("0d5d946317d93bddb5b0860cd8793030")

pkgver() {
	# didn't get it in one sed expression
	$srcdir/ttnctl-linux-amd64 version | grep Version | sed -E 's/.*Version.*=v(.*)[[:blank:]]?.*/\1/g' | sed 's/-dev/dev/'
}

prepare() {
	wget "https://github.com/TheThingsNetwork/ttn/raw/develop/LICENSE" -O $srcdir/LICENSE
}

build() {
	echo "foo"
}

package() {
	install -d "$pkgdir/usr/bin/"
	mv "$srcdir/$pkgname-linux-amd64" $pkgdir/usr/bin/ttnctl
	install -d "$pkgdir/usr/share/licenses/$pkgname"
	mv "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}

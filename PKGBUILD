# Maintainer: Sönke Köster <skoester@cubuzz.de>

pkgname="tigerbeetle"
pkgver=0.16.11
pkgrel=1
epoch=0

pkgdesc="A distributed financial accounting database designed for safety and performance"
arch=(any)
url="https://tigerbeetle.com"

source=("${pkgname}-${pkgver}.zip::https://linux.tigerbeetle.com")
sha256sums=('892172989a9d04eb1b85e283353de43d0a030604acf8ae1d8dc04736be4416da')

pkgver () {
	./tigerbeetle version | awk '{ split($3,v,"+"); print v[1] }'
}

package () {
	mkdir -p "$pkgdir/usr/bin"
	cp ./tigerbeetle "$pkgdir/usr/bin"
}

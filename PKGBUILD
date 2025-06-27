# Maintainer: HurricanePootis <hurricanepootis@protonmail.com
pkgname=pinesam-bin
pkgver=2.2.16
pkgrel=1
pkgdesc="UI for Pinecil V2 - control it over BLE from your PC or your mobile."
arch=('x86_64')
url="https://github.com/builder555/PineSAM/"
license=('MIT')
depends=('zlib' 'glibc' 'bluez')
provides=(pinesam)
conflicts=(pinesam)
source=("$url/releases/download/v${pkgver}/PineSAM-Ubuntu-x64-v${pkgver}.zip"
	"$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('69e9c291becd3c6596cc0c0ef609ba2bbcf6d1d2f394ddb8096992a554e18df3'
            'a63b711d8793124d38c40f455ae6c4f126d69cc1ddf32395677f91c4e0784840')

package() {
	cd "$srcdir"
	install -Dm755 PineSAM "$pkgdir/usr/bin/pinesam"
	install -Dm644 PineSAM-${pkgver}/LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

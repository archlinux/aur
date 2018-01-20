# Maintainer: Julian Brost <julian@0x4a42.net>

pkgname=asp-https
pkgver=2
pkgrel=1
pkgdesc="Arch Linux build source file management tool (with patch to use HTTPS by default)"
arch=(any)
url="https://github.com/julianbrost/asp-https"
license=(MIT)
depends=(awk bash jq git libarchive)
conflicts=(asp)
provides=(asp)
makedepends=(asciidoc)
source=($pkgname-$pkgver.tar.gz::https://github.com/julianbrost/asp-https/archive/v$pkgver-https.tar.gz)
sha256sums=('38043722d92122e9f72a9924e20b1556cb80d1be1b19b7ead70674c8249308c3')

build() {
	cd asp-https-$pkgver-https

	make
}

package() {
	cd asp-https-$pkgver-https

	make PREFIX=/usr DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/asp-https/LICENSE"
}

# Maintainer: Julian Brost <julian@0x4a42.net>

pkgname=asp-https
pkgver=1
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
sha256sums=('2e1b2831bf5fc81ef64f26e0832ab697fccd2e05063050917f40f062ee512069')

build() {
	cd asp-https-$pkgver-https

	make
}

package() {
	cd asp-https-$pkgver-https

	make PREFIX=/usr DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/asp-https/LICENSE"
}

# Maintainer: Andrii Berezhynskyi <microsolutions_harebrain@aleeas.com>
# Packages the published Scrolex x86-64 binary for Arch Linux.
pkgname=scrolex-bin
pkgver=0.11.0
pkgrel=1
_pkgfullname=scrolex-$pkgver-$CARCH-unknown-linux-gnu
pkgdesc="A Horizontally Scrolled PDF Viewer"
arch=('x86_64')
license=('AGPL-3.0-or-later')
url="https://github.com/molecule-man/scrolex"
depends=('gtk4')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$_pkgfullname.tar.gz")
sha256sums=('97d908f7d0a95284ad6cdbb7c8d2d501c8d1e51eca586dd2c8cc8b142548991d')

package() {
	cd "$srcdir/$_pkgfullname"

	install -Dm755 "scrolex" "$pkgdir/usr/bin/scrolex"
	install -Dm644 "resources/com.andr2i.scrolex.desktop" "$pkgdir/usr/share/applications/com.andr2i.scrolex.desktop"
	for size in 64 128 256 512; do
		install -Dm644 "resources/icon-$size.png" \
			"$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/com.andr2i.scrolex.png"
	done
	install -Dm644 "resources/com.andr2i.scrolex.metainfo.xml" "$pkgdir/usr/share/metainfo/com.andr2i.scrolex.metainfo.xml"
}

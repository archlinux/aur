# Maintainer: Andrii Berezhynskyi <microsolutions_harebrain@aleeas.com>
# Packages the published Scrolex x86-64 binary for Arch Linux.
pkgname=scrolex-bin
pkgver=0.11.5
pkgrel=1
_pkgfullname=scrolex-$pkgver-$CARCH-unknown-linux-gnu
pkgdesc="A Horizontally Scrolled PDF Viewer"
arch=('x86_64')
license=('AGPL-3.0-or-later')
url="https://github.com/molecule-man/scrolex"
depends=('gtk4')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$_pkgfullname.tar.gz")
sha256sums=('d7ffe000a9e5f864c18c608e6fe954e33e42d54ab2463c5ada334a9deed1baa6')

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

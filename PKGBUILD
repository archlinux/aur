# Maintainer: Andrii Berezhynskyi <microsolutions_harebrain@aleeas.com>
# Packages the published Scrolex x86-64 binary for Arch Linux.
pkgname=scrolex-bin
pkgver=0.7.0
pkgrel=2
_pkgfullname=scrolex-$pkgver-$CARCH-unknown-linux-gnu
pkgdesc="A Horizontally Scrolled PDF Viewer"
arch=('x86_64')
license=('AGPL-3.0-or-later')
url="https://github.com/molecule-man/scrolex"
depends=('gtk4')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$_pkgfullname.tar.gz")
sha256sums=('29362a54ab1129067b390ae85d355db8a8f02514a0eca40ca8b1c335966bf32a')

package() {
	cd "$srcdir/$_pkgfullname"

	install -Dm755 "scrolex" "$pkgdir/usr/bin/scrolex"
	install -Dm644 "resources/scrolex.desktop" "$pkgdir/usr/share/applications/scrolex.desktop"
	install -Dm644 "resources/icon.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/scrolex.png"
}

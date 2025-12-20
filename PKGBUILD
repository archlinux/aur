# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.12.20
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-12-20/ruffle-nightly-2025_12_20-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-12-20/ruffle-nightly-2025_12_20-linux-aarch64.tar.gz")
sha512sums_x86_64=(1fde6b9f158b01eae974c0bd50f8fb5cf4a00eecaa6ce4764f8b6d67d1f3b0b57f49f707c387b6574dde14c028c01ca0bec512eb114a41240640da51207ef3fd)
sha512sums_aarch64=(a7e01b069a5d83646bbe1a0f32ad042fb22c0f9d19429fb2323b6de44f222af8605a1483470cffad88e43467652c015b61802efc055f2763921ec0f8f3fb8b4d)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

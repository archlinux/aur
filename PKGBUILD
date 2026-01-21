# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.1.21
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-01-21/ruffle-nightly-2026_01_21-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-01-21/ruffle-nightly-2026_01_21-linux-aarch64.tar.gz")
sha512sums_x86_64=(e170c99fb0508230a860275f0ca3a1cba0a956f3876f6c4721c2dabbdca114f6c5c3879380d7faaf32ab8b7fe896dd18234f3bc4d6ca8019524f1e32df36f89a)
sha512sums_aarch64=(429c6acb783d09752f2989dce73f1849f1a45d4124ef982fb87da47e5bc08edfc5cccc62af462d2588cc9d8d7fbedf47c8eecc44c4537115dbca349b460cf645)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.1.2
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-01-02/ruffle-nightly-2026_01_02-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-01-02/ruffle-nightly-2026_01_02-linux-aarch64.tar.gz")
sha512sums_x86_64=(afad9c74c7bb2732c17d61a72bce6233200c05fcfe9c041e1919e1d2fa8023a8cacfebe82bc92152b404c9f89941a6e41e98e3f0e7d678e8f5a21ea90fbec02a)
sha512sums_aarch64=(26515874529d8bb4c93139937f2eda9a3b98d494482bfe0899eda0767b9a7dbf0ec06fef89f6b15f897bcd5ce1f3d6a497b8be4413be72e11266181ef8826501)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

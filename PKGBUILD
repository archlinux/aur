# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.1.14
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-01-14/ruffle-nightly-2026_01_14-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-01-14/ruffle-nightly-2026_01_14-linux-aarch64.tar.gz")
sha512sums_x86_64=(d61cc00dafe0edcce873444314116e62c275b6107b503913963c1a94f75c904f57190700ba59ff04b9cc7beb65ffafc8912f13f4e5b22c3c5abcc5a554843190)
sha512sums_aarch64=(7118d85c1af1e7bea25700b4ed482d1fdece3014ba302252a4f7bc9de59b9c1374cc8833c46c4e5bb6726b9aa1bfa4dba72b9588dbdb62035e9bb4a451c86acf)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

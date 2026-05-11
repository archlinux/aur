# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.5.11
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-05-11/ruffle-nightly-2026_05_11-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-05-11/ruffle-nightly-2026_05_11-linux-aarch64.tar.gz")
sha512sums_x86_64=(f78a634c08333fd79ccf8b2bb703cc87233277e3969e610b5d9f2d712ef63e2846e70ec7eb87eb8390239e38dd550beef6f1d8a6081d88748b67bd0f905f2382)
sha512sums_aarch64=(34175a3023bc37751f5dacbf6d888ddf162fc2f9e5a2dda50779a7631a491916d63f568396184698fd274c114b324159fbbcbdda85bef3bfbd6fb42f28f03aa1)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

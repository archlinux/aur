# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.2.13
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-02-13/ruffle-nightly-2026_02_13-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-02-13/ruffle-nightly-2026_02_13-linux-aarch64.tar.gz")
sha512sums_x86_64=(cbfff6a95e577c81058bd687abd30c2a11576a61a39a42de1958653032872893249a79baebfe7766a4447fbd491866f0f6a12ec260a954f70ecb31cb3b94c5a8)
sha512sums_aarch64=(fb41882f42150862ba9e437ac957f1a535a4387a12324851ea5955ca85e9ee3af7bc678ae5a22a48e98ffb13ffb1f833ff5aca0b07c27756b4df4daa55326654)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.4.12
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-04-12/ruffle-nightly-2026_04_12-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-04-12/ruffle-nightly-2026_04_12-linux-aarch64.tar.gz")
sha512sums_x86_64=(7ffeb4a416f5ea4a3f7430f74619b954cf23505484ad446442545070ed2b4ccf20fb9de9e01aea7431e9d8b4e0f962cf613de596a08b7104cb40edacc6a529a3)
sha512sums_aarch64=(30007201bf7ff4e8d26caf2ebccd41e9e7b81279874f7d9806db76602446fc2c9c669453d94a50018f48d707d6f210fc115bee2ebf7bfdf8f11a06b536ea1960)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

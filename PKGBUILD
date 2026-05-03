# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.5.3
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-05-03/ruffle-nightly-2026_05_03-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-05-03/ruffle-nightly-2026_05_03-linux-aarch64.tar.gz")
sha512sums_x86_64=(85df6470161b69ca0e4a915c40a25f1e3e84e939eed24aa9b3bb182aff78f5485fa613b4b63a701cfec3441adf706959db1fd551ec2c4eb04a654f105b294c83)
sha512sums_aarch64=(dc9b16dca39ada9a15c96befb1ff16e098c9ea98bec25d2166fe20fea0676d564f0e16f6f32c8feee44eec8ae1b517bbc16a0f6e9bfe0f2468adc954119cda2d)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.10.23
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-10-23/ruffle-nightly-2025_10_23-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-10-23/ruffle-nightly-2025_10_23-linux-aarch64.tar.gz")
sha512sums_x86_64=(e80e5e8ec08ad9bac169a52bcaf09ee57851906dd27fee594a1a9f0228fbba813275b1e3f9d9c553f2b43551c4bcd065efb3487f1b801d3b195e7da17739e40d)
sha512sums_aarch64=(e42c9e1d97ceba6c75759bb5c6d86efcdff3ea065d986354ea390d10c35d94c46ba79ac7332ef0fdc31257326d910ec65c86ea854a1cebef1e28b339127164d0)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.4.30
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-04-30/ruffle-nightly-2026_04_30-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-04-30/ruffle-nightly-2026_04_30-linux-aarch64.tar.gz")
sha512sums_x86_64=(8a39fdc81d7f6a7053126acc0dd4128640230c072af3dc58d6f77df5ec0166cbb1c85b62aea9a6e8d36846d395c5bea73efbc0cb363e2de33c267c84a53a95ec)
sha512sums_aarch64=(9d71deb076e1f25d62a761345f77723d4060c2c91bf96b4a97a105734a1bce1ddb8e1ae243537fb3d1d3f0dae1b95375bee476e079f646b6034631a617727c30)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

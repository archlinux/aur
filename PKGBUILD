# Maintainer: Kamil Jarosz <kjarosh256@gmail.com>
# Maintainer: Ruffle LLC <ruffle@ruffle.rs>
# Contributor: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.9.30
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-09-30/ruffle-nightly-2026_09_30-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-09-30/ruffle-nightly-2026_09_30-linux-aarch64.tar.gz")
sha512sums_x86_64=(cb6cc5b89fb35114c3bf421367b9f2e2e90a05db15f49dfb7348facceef69d030d9b411e406920e479d66881fe143b47c0d16b9bbd960e30fd64eee956aec0e3)
sha512sums_aarch64=(ed1a4f072856d45e36feb4fac6862075708d7e92549d1ba555451fb547be09fe8287eb4f905d63dd3b61daba5518d53a79fe4729de741dec9c3b9da8dbd3aed5)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

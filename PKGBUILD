# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.3.3
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-03-03/ruffle-nightly-2026_03_03-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-03-03/ruffle-nightly-2026_03_03-linux-aarch64.tar.gz")
sha512sums_x86_64=(4308a330b0b835e878b389789a659c7f87c103fa56da959fcd1d61346bd73051f7d02f67d39cc5980163e240e9373c9cfdc64fdd21ad855fe7eaeb6842395609)
sha512sums_aarch64=(90359002ffeecfc89964db0c9f7c29d8bd62541b7196fc8e0bd34e3c4fc1f59eaba90f58abcdf019d36adc71e9de7750d79c16fd124461a8722a0fc5a0fd7259)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

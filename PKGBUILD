# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.12.16
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-12-16/ruffle-nightly-2025_12_16-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-12-16/ruffle-nightly-2025_12_16-linux-aarch64.tar.gz")
sha512sums_x86_64=(8ab2a8c8350d6376db4a3b07dc14da89985b992707424c6f1ec5eb0cd3f855bd13ba6e09393c0e6b95b3974dca1c4646bef8bc27090e27991c614a88ea7fc3e5)
sha512sums_aarch64=(69afb17d8c8bde962524d38182158e2ef5a55ac65069b9f39a649c6d01909834903825325bf3cbdd92545d778855896e35ae242873cf82e91b85b27d0a16465e)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

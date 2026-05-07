# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.5.7
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-05-07/ruffle-nightly-2026_05_07-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-05-07/ruffle-nightly-2026_05_07-linux-aarch64.tar.gz")
sha512sums_x86_64=(61282c350ef14c5a4280801a3b2c06e59fdcfde4ffeb64b2d83c4dd06ba69d94a6a739df96bf185ec83546330d5e07978211a88d65d7f5ac90c77e5079f547bc)
sha512sums_aarch64=(93c81f0de6e6d0a4bc3d317daf5b139355799e830cae1b9118530030ae63e8aba0fc988592ce032d4cb5097c3123c078ada72b02f97abeb6ea8fc7b93b0689e8)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

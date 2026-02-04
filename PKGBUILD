# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.2.4
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-02-04/ruffle-nightly-2026_02_04-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-02-04/ruffle-nightly-2026_02_04-linux-aarch64.tar.gz")
sha512sums_x86_64=(58915354e7b63888df52d8f8a73fb7b56731daa3fdfe3487328c60ed43966af2ab1d7ae6dce43f6550cad5f0238b3b362bd6b00ca3d138456824495b96dfbed9)
sha512sums_aarch64=(12027b65a878fafdb8ffafc311cc2dd65ab1d95eff45a16cde1b84d695193b864582bb7561a984c5e55f2a20114628212623a2d6a2d0ed77677a9e3e699c7645)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.2.6
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-02-06/ruffle-nightly-2026_02_06-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-02-06/ruffle-nightly-2026_02_06-linux-aarch64.tar.gz")
sha512sums_x86_64=(b85fbfb0e03928f079943270702271148fc139b7f54f75c871f5dc08ee624e21866c0e1bac79d9f8193ad58e6461e6a19d17630406acaf10b7d49e4cac42ac14)
sha512sums_aarch64=(37e0dba56d57d3c3a64b8dab9fa1ab748abfc536e8f917f0e9a1a93b22f929ec987da3b8e72e471eeb2919d3e068657885aeaa49bc80b9624415943f9da6d85b)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

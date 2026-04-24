# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.4.24
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-04-24/ruffle-nightly-2026_04_24-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-04-24/ruffle-nightly-2026_04_24-linux-aarch64.tar.gz")
sha512sums_x86_64=(ddf894f29f2c1bab324d4a15c3c4caec49da441e8e513518922b87757e9f124ca920f6ce0953ea082c07a4e41b639792bc6553079e3dedeb6db03d1acafb4fde)
sha512sums_aarch64=(ba18e4c259ffefe020026cca77c0c8c7d1f57b87ac42e622fa956b5e9283b915bd38c44a1a10bdc54818e33d9ab87ec0c6d5e0ac08337fe89fc2f889b30fcad3)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

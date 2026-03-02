# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.3.2
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-03-02/ruffle-nightly-2026_03_02-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-03-02/ruffle-nightly-2026_03_02-linux-aarch64.tar.gz")
sha512sums_x86_64=(c31107df907bace92d0e5264cb67dcb19645031d4f0b4f5a3226880f5911c294fa610079ee5dfe9c872e5909161c3d9726bd80fe904bb65d8472a1f87f4d5bdf)
sha512sums_aarch64=(6c06c0ee7768e02d60521a7dda4e22ee609ed184190fc147c180b7ca3833071452738cd0849904f7d72c4dbc88a13a90d4ac68e0a1eeb7fdd340874c3c82ae90)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

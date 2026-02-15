# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.2.15
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-02-15/ruffle-nightly-2026_02_15-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-02-15/ruffle-nightly-2026_02_15-linux-aarch64.tar.gz")
sha512sums_x86_64=(b0fb2c6d2eaa9bf964fa9cc9e8c1c366f77f61472a570e1275cb2f22b728ba40278e8a29044003329c62ae7f222e5305580f58c21ba0ac5e1a07b538712e49bd)
sha512sums_aarch64=(77e0e2bd10e166a3fe7d4af5879e54ea35025e07a55852051f0b914d22bfef3c1685e95483855a3e5d49f73ac6f3ba6c37d8cf3af92a597cd558ea789dbfb0db)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

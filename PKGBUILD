# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.3.24
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-03-24/ruffle-nightly-2026_03_24-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-03-24/ruffle-nightly-2026_03_24-linux-aarch64.tar.gz")
sha512sums_x86_64=(c97dc88ffe07a14c8361efe1c703cf2ec0276523be9524719ceed597a4c213cace3fa05f45089e6a1672a3ce10d67aa3d0fa6f95d70036792a95fc1db150e07e)
sha512sums_aarch64=(785713f12381a0a133376bc449c996bb2b1a36605b3140a1765ee954915b0a857c2f1d2364b92ada3a36eab4000e3436885fa1484a12fffe24ef535b1cbc3559)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

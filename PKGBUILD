# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.1.8
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-01-08/ruffle-nightly-2026_01_08-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-01-08/ruffle-nightly-2026_01_08-linux-aarch64.tar.gz")
sha512sums_x86_64=(82f5f121f93ad8f3e5b12714607a7ed794ae0e1a4e36184f66e6234d71d62a798d1c0e61f32d2633185f4f3cdab9d4731277a4ea40b68f5a90a96b22e6d79dde)
sha512sums_aarch64=(3fffe154ac4ff541a6608f080900ecdc6ee01cb3cf473ffbe634bf9d04288cf759e4203cd9fa0bead71a3903c64844ec48f39c3b0112520b25be5a5b2700a1ad)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

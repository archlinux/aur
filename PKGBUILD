# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.3.4
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-03-04/ruffle-nightly-2026_03_04-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-03-04/ruffle-nightly-2026_03_04-linux-aarch64.tar.gz")
sha512sums_x86_64=(96cf7e2162c1ae11ab3d5fc8a4788e32617d7ef35e72109b40b692a17a90cabbfd9abe365dc4f49b5f53f89908125c7d9839fdc6aeac3e8b18106aef97782f47)
sha512sums_aarch64=(ae38ad306cf5d412a5af25d8cb4f9e22d5ee8820588df7e3d8e59778de0f36f32855b551c10d1217ab6cc836156207da51b73a0aba398dceb415d60d5aab95a5)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

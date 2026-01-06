# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.1.6
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-01-06/ruffle-nightly-2026_01_06-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-01-06/ruffle-nightly-2026_01_06-linux-aarch64.tar.gz")
sha512sums_x86_64=(bc7e64b8b946c8d38bea29b80d38ef99cabe6d162c38dce17e62f2db9f10f9ebdf1908fbf742b0bfe72d716ccc53d1cd81dc4eca4ad61b2d55d511bf3ec9bc81)
sha512sums_aarch64=(5acef5acf5ab4863927a2c07e77e16796f1a32894664aa0a3fc6e232f61a1a0d5798130a498a3d9e58b09e852a8ba9bc7e5e985ecff2e8f6d2d7091147b6b09e)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

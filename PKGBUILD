# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.3.12
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-03-12/ruffle-nightly-2026_03_12-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-03-12/ruffle-nightly-2026_03_12-linux-aarch64.tar.gz")
sha512sums_x86_64=(22a9325fd6d58d0fffdcf305df490d4b9caf59056fa95b217047947c2e14df8621fbdda5fe7149a3e1a3c3885deb3b20c444f8edf8f9a3b19697d21d7dbbee27)
sha512sums_aarch64=(728542b33fe029a21b6c4d6a0d95e7fdef7ed3c645de6bbc08a191a8ed1d73eb50517d5f868470c12cda0618f0f5e4a7abb809b88555862c6da415f7d06d1f32)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

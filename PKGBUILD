# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.11.4
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-11-04/ruffle-nightly-2025_11_04-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-11-04/ruffle-nightly-2025_11_04-linux-aarch64.tar.gz")
sha512sums_x86_64=(fcd24c5213b1ccbe47f2e2d40555ca1d2f80d5c3449b24861b549b92f650cb9415e381a0c81b67f686444c9aaa3b4a0564d7df6b9b2a19acbcc979659d1d8052)
sha512sums_aarch64=(c0bef5804513e987049b9e5dde2f779b4494dd238a667c9ac41ed5a287d4fd80bffd98474687d24a9660c7537d86b8229c74428b3c747af114232b02bc550752)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

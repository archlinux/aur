# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.3.10
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-03-10/ruffle-nightly-2026_03_10-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-03-10/ruffle-nightly-2026_03_10-linux-aarch64.tar.gz")
sha512sums_x86_64=(1b510224ec0fe046c150e4a095f1b901d4409092cad9e6fecf89c948bbe472ba3f522a7eea5ae0d4aca799820d48358e0f83ab5134f9f842e762c52932903bdb)
sha512sums_aarch64=(0525a66b6d4c91491578b944f57140a82cdf409db7aef94f38283f2103c3e10b4b5c47ab5545454d4ec84ca77024daec9e552cf5f9b401baa02856ad7f6193c8)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

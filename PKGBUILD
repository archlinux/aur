# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.9.11
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-09-11/ruffle-nightly-2025_09_11-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-09-11/ruffle-nightly-2025_09_11-linux-aarch64.tar.gz")
sha512sums_x86_64=(d04f3943af3ba3a6300549a2d3a90fd5a4fd26d4795a5dc8ec34f9fa6e507c11443d13af4321ce5ee94b633fffe3f92140b5cb9e2ca56e71307027a08842d863)
sha512sums_aarch64=(66c56b92df753971acae87ac7cac07cb81d97e2423fd8021a1d4d964e92b590b981b82421b8b3afa0bc3fe720fdd3765904282c6bb06960a6f5b881d55f78547)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

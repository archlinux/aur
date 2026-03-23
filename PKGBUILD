# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.3.23
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-03-23/ruffle-nightly-2026_03_23-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-03-23/ruffle-nightly-2026_03_23-linux-aarch64.tar.gz")
sha512sums_x86_64=(8ed215e434a0cbc1d7c64d697eafd4ee463db74d5d182e7c0131aca7f2305fd0d6991a9392a82d7d40f9e6d74868c8f980a0a62aa9d5ddc02149ea91a5d25723)
sha512sums_aarch64=(3386ddcedf24a2abfa17557f4f097bab1e72d9509a9718b053caaba3493128cd20076d77c2bf3d27155314aff4a6870b3ae67f0c846b41a6cfa0442160120e57)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

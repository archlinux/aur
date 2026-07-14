# Maintainer: Kamil Jarosz <kjarosh256@gmail.com>
# Maintainer: Ruffle LLC <ruffle@ruffle.rs>
# Contributor: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.7.14
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-07-14/ruffle-nightly-2026_07_14-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-07-14/ruffle-nightly-2026_07_14-linux-aarch64.tar.gz")
sha512sums_x86_64=(dc97117638bebaafc5af6407322d8a4cad08a78eb9da39fbdd2e52de75e0c714ce919cf38ec877305649010551d0421beca878d62edb055ace5d807282ced9a4)
sha512sums_aarch64=(2b3eddcd09d5d197543eb3ae11114c82afe0f51dabe79da1ef9af8fcbe626b48a738893afe7c5e5937fa4f4b104c20398b8fa1a1ab328fa73be06391c8fe3d70)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.12.8
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-12-08/ruffle-nightly-2025_12_08-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-12-08/ruffle-nightly-2025_12_08-linux-aarch64.tar.gz")
sha512sums_x86_64=(5a51f02614739a104074ee388c519ec4a306357b36e9315689ce4fbd492e7d2445630cf72ae41f67ab10f03bbc93312b03a615a7e7a4c2e1df1d722dda7cfb7f)
sha512sums_aarch64=(e9f4251f7038c47ac6e7454cb1dd87f98c58051bf235b1e2642f24b62ad0653c47a934acd15b892618a0419f444a4bbcdde9337cbc0afb4adcf79a2525457163)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

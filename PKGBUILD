# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.10.31
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-10-31/ruffle-nightly-2025_10_31-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-10-31/ruffle-nightly-2025_10_31-linux-aarch64.tar.gz")
sha512sums_x86_64=(4af3c9cb054a1d614588884c1dae31e9366b1081d5a92e720f1cc60c8c39481ba838d2ac1c22ca713f0dd17565bc07cae6410a1c0bfc95a3e84be50c4484f349)
sha512sums_aarch64=(f04db9f64b327fe5d3b56117430652ad11461e9a8e89f334c923dc981c4831104c2abef9fa8af76b53fb37480831ae9a7f31bc95ce85f87d3d67cfb06cff8af3)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

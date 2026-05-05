# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.5.5
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-05-05/ruffle-nightly-2026_05_05-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-05-05/ruffle-nightly-2026_05_05-linux-aarch64.tar.gz")
sha512sums_x86_64=(efa4d14ddf1368e2920bc6ca4b39c15b6b262ddd3ee33e1732fdc786d6d22ffdb8b1a09833fb1a183470b6b0461a1220e679070970825df1a4ac44e9d8595612)
sha512sums_aarch64=(bd63416c8de81ca0b73963c06f97b762e8cde46a71c9f248d49d95de32a7073fb60effa8b4e31de2e42d2763920073ddb292de44a9586fa7281265f121d5bfe1)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

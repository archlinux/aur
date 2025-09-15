# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.9.15
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-09-15/ruffle-nightly-2025_09_15-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-09-15/ruffle-nightly-2025_09_15-linux-aarch64.tar.gz")
sha512sums_x86_64=(f2a8522d04f1b61b9fa1530dd430cdbdaf7f54aca264a7b9739dad6ebcc51535555b9832042793ab04921bde2b26b5a613ff0a21caabef9f1d2a531b933a9d33)
sha512sums_aarch64=(4016af1d2ee30885510b5c4f3076ee9b68368b98826f0d9aa42093be96766ef4aa1338634cf9dc5b3be1972e80666c0389b38cbde15eee088fa4254d2ed3ea1d)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

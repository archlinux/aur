# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.9.4
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-09-04/ruffle-nightly-2025_09_04-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-09-04/ruffle-nightly-2025_09_04-linux-aarch64.tar.gz")
sha512sums_x86_64=(5c415ce5285b75ba6bb6ef319065412b89ac4b12cb8c18b7e4edc911f586f1f070e801b38bb45aa7d5b3e0101e221e1d4eef9d4048c0b19e6f234110e5efa06f)
sha512sums_aarch64=(2622a52d6270faf0f9611c1d0f666961296c59b4d33395be82e98f69e7d96a7625a31eb7426d244b19e117a652759d395d8ff5f3066f5937166777a8a5732f52)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

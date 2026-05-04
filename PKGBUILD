# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.5.4
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-05-04/ruffle-nightly-2026_05_04-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-05-04/ruffle-nightly-2026_05_04-linux-aarch64.tar.gz")
sha512sums_x86_64=(d4f0992c5f04ca356d4af39cdbe8aed4a7837a97044022f2e3add3a49ccbbb4430bf26224f8755a460b2121dc940e484ba6bcd1708ab191e58ca8e7642731df3)
sha512sums_aarch64=(e32fcbef444e7c70eed891c8e4493adb69f1573093c4bb96f7ce6fa91aa10c4d70d416ce05c8b2660f0a67dfe4de394e50994c5bfa1bf1e175490a115df5a50d)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

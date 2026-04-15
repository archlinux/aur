# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.4.15
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-04-15/ruffle-nightly-2026_04_15-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-04-15/ruffle-nightly-2026_04_15-linux-aarch64.tar.gz")
sha512sums_x86_64=(6bcd7b1b29f0503ae78812486f87640fbe2ab2214757459dbbb6fbb3f4823b5a45b0a572419a845e3f452753d2f33c49c95985ae4eeb27970cbd40353e23aee8)
sha512sums_aarch64=(5fc705902b4e7fb65633342221849ca278c655ca70d11ea0c373141c71ca1ad4d66d0df20f4bb019b5b7a2831f456de9ba5dd94bcf1dcd70cc671e199480767a)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

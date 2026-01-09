# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.1.9
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-01-09/ruffle-nightly-2026_01_09-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-01-09/ruffle-nightly-2026_01_09-linux-aarch64.tar.gz")
sha512sums_x86_64=(d33d2d89b76a6a5dfa6886b6e7cec3e45a1da4f81142e6c0683027ed3cd740001d452831880baa45e8e4604ae0355ce49f487af02b6d34a86ea528b4128881dc)
sha512sums_aarch64=(cae2cb8922e81e69b0565b3d17f0d9891943fcbca6286fb761a9a5b6a1620ef53421636ac44c539b3a4025a11542c3a8102e47ae4abb79da60982bf6e3fb4f1a)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

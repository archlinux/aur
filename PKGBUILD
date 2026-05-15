# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.5.15
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-05-15/ruffle-nightly-2026_05_15-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-05-15/ruffle-nightly-2026_05_15-linux-aarch64.tar.gz")
sha512sums_x86_64=(7b03f486df423683aaf4769870e96e479d75aeb8a01119dcd28deed7a196ad8b9308177907d3a11bbc2bcba584d335fe10afdbfc1ed01d6b7d9bc10b56b70e78)
sha512sums_aarch64=(497d37dd9477d1777c5d52fb6f4bf31109f702e4477eb3cdb46a3196912ba1e7f08a3132333bbf6ca6d9e30b53a6b262cd2557af1eb0370beeadb3bed2aa4ae5)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

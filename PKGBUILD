# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.5.14
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-05-14/ruffle-nightly-2026_05_14-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-05-14/ruffle-nightly-2026_05_14-linux-aarch64.tar.gz")
sha512sums_x86_64=(e9bc9b5913ef300a9bd39dfbf4a1bbbf62e3d80307da1bb7dcf4313894afbe72468a9abb53fce4eaecbf03c80c331b7b69e626015e9086781123cebc525f2a70)
sha512sums_aarch64=(81aad60f920bf69fb4362bf9b33e02ef8d09d15eb3a321af253546121b6ff9dda49f8ebf6d8e56b77d8997b1b251eed363820da3419b8eafc10e54e9488fed12)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

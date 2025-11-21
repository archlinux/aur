# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.11.21
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-11-21/ruffle-nightly-2025_11_21-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-11-21/ruffle-nightly-2025_11_21-linux-aarch64.tar.gz")
sha512sums_x86_64=(dae0750e8b62cec8455e2f17277200e69ea63ad6298cf14cc3f12b5dc6533268db54fb9b0e05b59e7da816bd3365f588f26a901f1507582c0f52774281e8ebaa)
sha512sums_aarch64=(6c78713d7d849b4cf3da64405c8f8090d26f4f5048e94c94c5cbe5817ac487a031696f2116bb7a95c95a08c44cd40bfd70dc7491d9595ee0bd053104b993e8de)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

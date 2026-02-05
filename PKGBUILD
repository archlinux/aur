# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.2.5
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-02-05/ruffle-nightly-2026_02_05-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-02-05/ruffle-nightly-2026_02_05-linux-aarch64.tar.gz")
sha512sums_x86_64=(9efdc2ba1da2cc898fab17977f8cb34abf69c9bfb78e3547c3e2e051e9a679b6de71437b439b83cd2ebfec774aacb73adf7c6a81f77e1866dd75eef8dd631e09)
sha512sums_aarch64=(8dd2c5c1cd75b866010561e59de3d5d451da07c7ceb4c30a6ba55c499f73752af989a9824d8f252074461395f6dc3102ec322100cabb80f00e82657e79bd5dca)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.4.3
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-04-03/ruffle-nightly-2026_04_03-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-04-03/ruffle-nightly-2026_04_03-linux-aarch64.tar.gz")
sha512sums_x86_64=(ad42a0e6c43adbea3f72e262b526ec4f4e895c4c13ba0eecac026018034b8c11457fa87b8b08e49e45270fe52af13f8325201d608ec26c00df24e60f73dcb0d2)
sha512sums_aarch64=(0f76cd9cbde3b468d17eaf1ef9786a11b13a4235ffe92bc100ad9db561dec3387bdbc13f3c8faa14197668c35d0914453bdc03225d1e1db249e2bd31f0441618)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

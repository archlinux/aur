# Maintainer: Kitty Dae Elliott <kdelliott@pm.me>
pkgname=ruffle-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("ruffle-${pkgver}-linux-x86_64.tgz::https://github.com/ruffle-rs/ruffle/releases/download/v${pkgver}/ruffle-${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("ruffle-${pkgver}-linux-aarch64.tgz::https://github.com/ruffle-rs/ruffle/releases/download/v${pkgver}/ruffle-${pkgver}-linux-aarch64.tar.gz")
sha256sums_x86_64=('a07978cc86ea33f745682201c6240d27bc51944a2732e09a973f2179581999a0')
sha256sums_aarch64=('e03923eeeeec5deb19f427b4b4c58d4b2b6039f77ea36470bff8de829470928f')

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

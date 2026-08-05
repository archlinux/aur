# Maintainer: Kitty Dae Elliott <kdelliott@pm.me>
pkgname=ruffle-bin
pkgver=0.5.0
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
sha256sums_x86_64=('aab2f543666d8e7a2712c51e74bdbcd5fe05d5c1b65d8d834ee50379a397ad6a')
sha256sums_aarch64=('e4fcde7f0f1e03f283ce21dd1fa8ffb34317e56df8972293096378d65ea7d8cd')

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

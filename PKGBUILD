# Maintainer: Kitty Dae Elliott <kdelliott@pm.me>
pkgname=ruffle-bin
pkgver=0.6.0
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
sha256sums_x86_64=('983acb2600dedf8ba6ecbeae1d9eb3a10202a5f3e27a5ae049281145dc99127b')
sha256sums_aarch64=('9f8c57e8ec5bbc0dc8a0040575ffe28a1e7bbc16b187d611697cee998186ec19')

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

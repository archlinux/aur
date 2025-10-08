# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.10.8
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-10-08/ruffle-nightly-2025_10_08-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-10-08/ruffle-nightly-2025_10_08-linux-aarch64.tar.gz")
sha512sums_x86_64=(8c0d07dd488f24f634a236d5e3c4768a83effb3e37e6508398014da7647a969c3188b02f67c9c942ccf237b45228c6f91b7dfa357c95e4edd0668f8e79e7ef23)
sha512sums_aarch64=(bdb04f01d532d37d7af7b529a7a53022c4077aabfa6f7378e5c1b9927fbc14bf6e9568c27935679b65bc2ddccbbbd7f810cc9b517b53ff345c5f1c97002382c0)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.11.18
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-11-18/ruffle-nightly-2025_11_18-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-11-18/ruffle-nightly-2025_11_18-linux-aarch64.tar.gz")
sha512sums_x86_64=(ec3f616ecb7528c1a6ffe1f6ac46de8d9488ee6327e8948e239d058fd990f0ad57cf42a972374fc61f4c2b584b6a00beec3e1297aac9f6af4376c2386d3b8061)
sha512sums_aarch64=(cc6f163f20802009c1d1ba6df1ef22ea62d678a28bd9d1d961e21844d87906c4bee145bdfd0416019ad65953b8bbec34b9f37c8cc83437835e662e62608d361b)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

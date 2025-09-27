# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.9.27
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-09-27/ruffle-nightly-2025_09_27-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-09-27/ruffle-nightly-2025_09_27-linux-aarch64.tar.gz")
sha512sums_x86_64=(2fe2ceabc4d17f114d7937d765d5d88c5065cd73dd9aa8eb1d2284fbca1504b19dad295428d5ecf02c3a75282efcf5ba725136d7d056d8486861211a01ee42eb)
sha512sums_aarch64=(29d2c92b65393fded9e416e4b58148463b3da338a725d9d396fa8bb0be09cb945955ab229d7bc22aad89cb7b5d0c4b94affa61f3eb0a58ebf2f6550637a8297a)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

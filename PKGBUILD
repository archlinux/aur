# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.4.23
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-04-23/ruffle-nightly-2026_04_23-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-04-23/ruffle-nightly-2026_04_23-linux-aarch64.tar.gz")
sha512sums_x86_64=(aca10ec2d132724ad9b9395206f3b54d25b0b88a13cd3c6f73edcf0a9906c2180944cc512f2016a346f31ffd5831438ca5a2f40ce8fa87cb134334707bd1ceaa)
sha512sums_aarch64=(e4841346080a740ca41305ea5ea7bb3b36140b16fd141718ae5c8640f2f257b477bae5021ff3838a1098940f6116a45a7f6324681ef25f316e61f2483b7e6a42)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.2.8
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-02-08/ruffle-nightly-2026_02_08-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-02-08/ruffle-nightly-2026_02_08-linux-aarch64.tar.gz")
sha512sums_x86_64=(4a9af79faa48bb77f1d09d9d80a51e32dea7414f93bcb429945af03f3fc9663a7f602aa8b6efc967f6f65807a3932dc02c7bd73fc363819293c5b3263202349c)
sha512sums_aarch64=(84d5f2b86deb17177ceb10e74e42df5f48f2f9d93b274ed6f1b125105291bf497c1250dec3ae1d76cd728b0ba611f7add26b17cb1a07f7e0f51f373430605826)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

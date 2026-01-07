# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.1.7
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-01-07/ruffle-nightly-2026_01_07-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-01-07/ruffle-nightly-2026_01_07-linux-aarch64.tar.gz")
sha512sums_x86_64=(3d0d34f2c2bac089e74371bf9b9711788c25b5e07516ad09dabc3e16fd1bb2a7279a0aaf23ac8b5a0dbab2c6d9e8ef45146ebb6baf25982c730a5cce856db2b7)
sha512sums_aarch64=(6336bc063d38f1ab675678e68dfae5267d2879a06fb845dc20a297fb3cc5f28c06dafa9a825ce46916ea1d456f580d71d4442ab904b2d92f571e6e33a6463255)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

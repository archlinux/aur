# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.10.13
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-10-13/ruffle-nightly-2025_10_13-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-10-13/ruffle-nightly-2025_10_13-linux-aarch64.tar.gz")
sha512sums_x86_64=(9f17bac6623e5b527d54fe26861edc3e8e396c4c3ab6c2a1648c278f0391f2e802407a1e6ecef6253abf54e20e73c6d3d3986d204f42a913b570f2f1d6967c23)
sha512sums_aarch64=(e36c1974d9a45e32d6c1c3c5e2b6aa6b7adb349a001422ff133b43ab48e9685af121729d1ef5faeaf7efe5d93cf440056470abdfd316964ac848c2a0d0cfc1e7)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

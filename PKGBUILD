# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.12.27
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-12-27/ruffle-nightly-2025_12_27-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-12-27/ruffle-nightly-2025_12_27-linux-aarch64.tar.gz")
sha512sums_x86_64=(b35d317ee57e2c3eb7b4878d5f44381e22d953c9c86fa44bf5821e481dde6630d5ad1c68a64291b7236548b1176a3bd1bafec521516b442cb8d32e2508a017a9)
sha512sums_aarch64=(b12444e174b05cf8ebc6b8300bf12bfc6020b36987604d4e37170e6529aeb9b22ee43adb849198a47f84961b9c80e1f0e940f7050d9e1d6d03c32785b6a08cf3)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

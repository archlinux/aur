# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.10.2
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-10-02/ruffle-nightly-2025_10_02-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-10-02/ruffle-nightly-2025_10_02-linux-aarch64.tar.gz")
sha512sums_x86_64=(58598e4be0bd77f36d738cddb5e85ded66da95ebdfd00850ff780341a5f9dba09340acbb6233da201fbdeea07d756e3d399b4e180e92113889156b3495dc8e0c)
sha512sums_aarch64=(298218749bd137152ca4880dc948d101c28c04039c3724a8a983d7a148484b3f3ff213f6a85ffc82b52efefb306ed163badf59ae4093f80545a10a20a87f3bb7)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

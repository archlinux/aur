# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.3.13
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-03-13/ruffle-nightly-2026_03_13-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-03-13/ruffle-nightly-2026_03_13-linux-aarch64.tar.gz")
sha512sums_x86_64=(6ec1b139c4e6a9badb07e82b1b44333e26f7a2b021db5e44772d60fd9e5eec00fdde3a6f3a3f4e16e317a61d7eac61cc965f8485bddb06b24c16c79facef0128)
sha512sums_aarch64=(0a217266de9d128a1c7b938c05fe2304ba4e7ba08f65a372ee28d0015ee366f319e3eec2fc451feb0bd83081978426f0d9444f96ca7717c67197bf8fcbdc9f35)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

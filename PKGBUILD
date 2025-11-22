# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.11.22
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-11-22/ruffle-nightly-2025_11_22-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-11-22/ruffle-nightly-2025_11_22-linux-aarch64.tar.gz")
sha512sums_x86_64=(04f7b541abb9574fb4d20c5a19234a0a21397c6a83513f7fe96a922fb39eb7b3ff64fc2d61ec9a91c3492f34a7a14aa0cf00bb952ef9824f9561d191c6c22697)
sha512sums_aarch64=(715bd055d35c3227fcd8f53dc094081c01c11b398a0f5499be3c6daa5cf6d9e67139a18ec0ce93912f13e03e540c12fc868284c3dddfc4c05cb7dcf1748f9914)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

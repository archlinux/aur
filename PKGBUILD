# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.10.12
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-10-12/ruffle-nightly-2025_10_12-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-10-12/ruffle-nightly-2025_10_12-linux-aarch64.tar.gz")
sha512sums_x86_64=(1632b7aca651ed6ab828e05bf3294e41d643e92d5cf549eb1ee11a9c956868c1cdd99ff7e2f8dbf0433555578124919c2dc971ab0ac35e0ebe0c2adcd81b471c)
sha512sums_aarch64=(514cf439b1852fa6cab69e5b99869ab6e120f4d5f51a3f745d89523a51a835ea948cedaa7158e958cc3dcf7759f66bd1e85a08045d580e0abfb9324736655ae0)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.4.25
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-04-25/ruffle-nightly-2026_04_25-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-04-25/ruffle-nightly-2026_04_25-linux-aarch64.tar.gz")
sha512sums_x86_64=(da35eb0c8905fee5ef3e2e3620773d97a095458ae454577f2d313fd797e0ee9c1a0cf997e7b25c0d42d8aead19135aeb688f908eded5ba426a5477e9342ac649)
sha512sums_aarch64=(b8f192b684eda1417cac74a86698445906371d37e9194955400f1770b3ccf46a3b987a7688817bb38b1500c7f349ed5fc35cf59b7cf327bddb60fc6cda3fc068)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

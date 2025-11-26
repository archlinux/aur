# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.11.26
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-11-26/ruffle-nightly-2025_11_26-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-11-26/ruffle-nightly-2025_11_26-linux-aarch64.tar.gz")
sha512sums_x86_64=(f98123bfa52d3f5e6d5031be875cf0005b6cb639cc3b0eee93d52115af8d0a62ea3ebc04f0a64cf953193e67e5681f6c7945d4b07acb76567adfa4d1127771c0)
sha512sums_aarch64=(6d139276c0c904867b0cf5233010fa841b5c3418719e41e25853fe8cb6270123ed956edfd2221283603ee33c1419bcb01e061e14e313192b8caad6a74e26e03a)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

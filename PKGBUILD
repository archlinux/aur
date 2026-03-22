# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.3.22
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-03-22/ruffle-nightly-2026_03_22-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-03-22/ruffle-nightly-2026_03_22-linux-aarch64.tar.gz")
sha512sums_x86_64=(195c6faeb632c007a90a9cd32e7ac702fd2f5bfcf481ca496d4ff1e1e6d529596c277c4453c399909fa23a68e65ec049f12429861bb37d9c1c0eeb75b10b3398)
sha512sums_aarch64=(a53b8bf62db8275971bfbb90b80ce8397dbb3c76940e287125f529ee834e10c5b6fd59ac02bf3d5b546b7fa8aaf61f77cb4b359724baac0b032f53cd3ad79f00)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.1.26
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-01-26/ruffle-nightly-2026_01_26-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-01-26/ruffle-nightly-2026_01_26-linux-aarch64.tar.gz")
sha512sums_x86_64=(6c6647510c15965c8e0f431ce82ff655933f7028fa67681a4d22afb9ad4f56e5e3e55e26ff6134377001f32c08e5b47c266c0acceda5f08fc339e7ff4c0afa46)
sha512sums_aarch64=(15f0972ea8a43d0db08146a48cfcf625a5fc4f94e41f8cd9bca2452236ffc5ea8fdbe08be2eff72934b87a9be959427216b072f340e233e7708d348cb4c9227f)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

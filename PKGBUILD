# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.9.26
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-09-26/ruffle-nightly-2025_09_26-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-09-26/ruffle-nightly-2025_09_26-linux-aarch64.tar.gz")
sha512sums_x86_64=(fc9c9fc3f6ef6aa2a093d46c6ee2de965d83cb192f0f9291ea48fe8080529c5b2476672e2a2575c4a498b4d6a0e68d43c612367d365c4bab71a6d2a61161a22a)
sha512sums_aarch64=(aa1f0e5419ca78c8d79d330b62362e645b928235635e7e9b29ae4eb669c2af4d7273875a6d036c410b9e22b15f0d11d1692912c734ce836e84b12122472a2a59)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

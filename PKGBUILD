# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.10.15
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-10-15/ruffle-nightly-2025_10_15-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-10-15/ruffle-nightly-2025_10_15-linux-aarch64.tar.gz")
sha512sums_x86_64=(ff5bd3159fb23fdf851c139a5724dbd06484353c19ca1c122b750f73cfc2cf0a50ad00a9cb1928d6aaa3a8b586b7b9e8459887c181e5f48c6a6629e7fcda27ff)
sha512sums_aarch64=(01032746d75958ccb9f06c1a29e12f70131100df6a42b60c146db46f676069b357654a362000de5a9d468f0a5ee45e84ea20e5711d1edf187e8f73ba30685447)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

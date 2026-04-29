# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.4.29
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-04-29/ruffle-nightly-2026_04_29-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-04-29/ruffle-nightly-2026_04_29-linux-aarch64.tar.gz")
sha512sums_x86_64=(ad317cde9d8e4a1d6ee2a4a530b1fcfd7b1c4af0fbdd38ff3ff1e16d17cbfc082a7aeb6fc6849ddb6d30c16c82b713b1ab292960ebdb5963bd885a537abe2637)
sha512sums_aarch64=(419e063a3d261700991e777eaf7a20b09696fb0a0ca98603f1d4b582fbc6be0949bb22782f4e6489b0aeb8c6cfac017a8b712b1006d7ea04efb92cab1488b31f)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

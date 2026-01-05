# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.1.5
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-01-05/ruffle-nightly-2026_01_05-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-01-05/ruffle-nightly-2026_01_05-linux-aarch64.tar.gz")
sha512sums_x86_64=(d3f7b854a0bf5402e5e79bdaef4f665d8772ef8d1136f03098936f1b4774dd978d2f698bd3eb8800811a50d99e3f7ab7be7149392af49995f698943d9353a3b0)
sha512sums_aarch64=(d8473f74aa1bba3f1799e43325052a1e1ac0385b5c174e1c79af2051ce8fb20520d11fe62c4e3c6659221cdb70d95cd1dcfef6b939e7781479bc447e332e431e)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

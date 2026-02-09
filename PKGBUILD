# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.2.9
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-02-09/ruffle-nightly-2026_02_09-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-02-09/ruffle-nightly-2026_02_09-linux-aarch64.tar.gz")
sha512sums_x86_64=(e86cbe4b42f6bb8fa13c4d795ebd1b28de27d7c9f8d0ac7f0988c1a4d45d5f1003306fae8e62ea00dfb5adffb060971302a7163811c57e7f260e7cf4b5359b47)
sha512sums_aarch64=(c87875d2bed3a49112d81a428a9effa029ffcd6042567059a1f6a9f0c0cdfe27560f2cbc21a09925afc24fad0e403d463cd6ba53b189a2e14ad5f63b5d7d0f5e)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

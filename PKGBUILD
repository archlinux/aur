# Maintainer: Kamil Jarosz <kjarosh256@gmail.com>
# Maintainer: Ruffle LLC <ruffle@ruffle.rs>
# Contributor: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.9.20
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-09-20/ruffle-nightly-2026_09_20-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-09-20/ruffle-nightly-2026_09_20-linux-aarch64.tar.gz")
sha512sums_x86_64=(73b9635df509899d931688833f1e9c8955668eed24fe6a8eb06a2a12e83577c5422c1619be2470fe9c7cf404197ffb425a4d697af13d06ea74c487f4caa93539)
sha512sums_aarch64=(fe2003d4f954cdb1ce3899e64aef9dc5c26c84f57657d30cadfca3ec53ddd4b65dd5a6de9af0cde813d0670bd084ff9af99379a075d6f853f6f8dbe220ecabd3)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

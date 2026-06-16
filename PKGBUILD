# Maintainer: Kamil Jarosz <kjarosh256@gmail.com>
# Maintainer: Ruffle LLC <ruffle@ruffle.rs>
# Contributor: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.6.16
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-06-16/ruffle-nightly-2026_06_16-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-06-16/ruffle-nightly-2026_06_16-linux-aarch64.tar.gz")
sha512sums_x86_64=(8feb6d5bc86f15bae6459be8c09c02717a5c48aab202ca42e09dadf6e71e8ec2a7cd5cc443e58977f60694760304330b033a1e4a0b226b1f7d0d6575a997bd0c)
sha512sums_aarch64=(c3731dc257cd20715b670ddc0b6bbe8ec0adf93132c2352d0d1412baad65a489aa779cdb262d3aad8ea543838a17f9335bb8c892f62453af2531224fe533eeae)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

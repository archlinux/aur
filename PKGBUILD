# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.12.6
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-12-06/ruffle-nightly-2025_12_06-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-12-06/ruffle-nightly-2025_12_06-linux-aarch64.tar.gz")
sha512sums_x86_64=(bff960ea105dab6c050b0841d85f3e999e1a7ea6fe6a45b6bd13cd2dee3bef56b484ad8aa3dba462a544f99fa0c8846d1a423a014018e7ec27e8b93c2a2480ab)
sha512sums_aarch64=(bdd69c35098f69c9073601def2424d6c343599b4517ff72f3f71b906205fdb3d5ecde1a76001eec0a1537999b5de1bc77128cc1e57c3ec7e29ba47117d4fbdd1)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

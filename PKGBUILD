# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.10.19
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-10-19/ruffle-nightly-2025_10_19-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-10-19/ruffle-nightly-2025_10_19-linux-aarch64.tar.gz")
sha512sums_x86_64=(7f17d588f4d9ed3b3d86fdb1c62d17cab3c947e8e2f7c8f8f5a12160bfb2fc99970be5a064c65eafc8f2dc5a48946d481894cf459b896bf248a06a74a7471102)
sha512sums_aarch64=(c267255d6e1084fe5165ad480e073b5fb31c97c92d4b1427c48692b19b8b9dab6e6ccf450cee674a3de6f74d88ed919323c3650b249cc87f4f08ae45e02dee00)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

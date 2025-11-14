# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2025.11.14
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-11-14/ruffle-nightly-2025_11_14-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2025-11-14/ruffle-nightly-2025_11_14-linux-aarch64.tar.gz")
sha512sums_x86_64=(d754513f89ec3c5ae021779348e08cb1c3811278735bc5bdbe6df9c9473e14821e0bf6d8e376985bf9805891ffaac0667b0f0052e75617c787e3349ca05ffaa3)
sha512sums_aarch64=(a018233554e4bfe13316b424011fcd454d23c836c7c2d91b22e4b122504a985e5971c2e31ec61d81768a9d10bf1f4d8678108a7b5e514e6759f59d49c7df7c4b)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

# Maintainer: Kitty Dae Elliott <kdelliott@pm.me>
pkgname=ruffle-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("ruffle-${pkgver}-linux-x86_64.tgz::https://github.com/ruffle-rs/ruffle/releases/download/v${pkgver}/ruffle-${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("ruffle-${pkgver}-linux-aarch64.tgz::https://github.com/ruffle-rs/ruffle/releases/download/v${pkgver}/ruffle-${pkgver}-linux-aarch64.tar.gz")
sha256sums_x86_64=('0a9ab494add5103b3fecf29ae0346097b5c820c1126eaeaa94264f95761f88f7')
sha256sums_aarch64=('1edcabe686ef1cc17dc888c1bcbb2d03ffdd92ad1e5ba5b991ed2d448af473c6')

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=ruffle-nightly-bin
pkgver=2026.1.22
pkgrel=1
pkgdesc="A Flash Player emulator written in Rust"
arch=('x86_64' 'aarch64')
url="https://ruffle.rs/"
license=('Apache' 'MIT')
depends=(zlib libxcb alsa-lib)
provides=(ruffle)
conflicts=(ruffle)
source_x86_64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-01-22/ruffle-nightly-2026_01_22-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/ruffle-rs/ruffle/releases/download/nightly-2026-01-22/ruffle-nightly-2026_01_22-linux-aarch64.tar.gz")
sha512sums_x86_64=(dcedf76c3198700f82172e76adeed1bdbc882e02bb3a79909913c2440105a215fa9b41ce158a17512c7e4c4ef77aa0c3b8e5b3515670ce32d37507ac52bcb53c)
sha512sums_aarch64=(02414ce1c69cd5cc11ef3a3a58b86fa9a2e8a176d9f3e0021ee2651565135b3fb97228c51fa1ccf6b250ec02eba6ac8d6ccc778e3a34d470273648d33559dd57)

package() {
	cd "$srcdir/"
	install -Dm755 -t "$pkgdir/usr/bin/" ruffle
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" extras/rs.ruffle.Ruffle.svg
	install -Dm644 -t "$pkgdir/usr/share/applications/" extras/rs.ruffle.Ruffle.desktop
	install -Dm644 -t "$pkgdir/usr/share/metainfo/" extras/rs.ruffle.Ruffle.metainfo.xml
}

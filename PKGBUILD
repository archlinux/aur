# Maintainer: Thang Pham <phamducthang1234 at gmail dot com>

pkgname=spotify-player
pkgver=0.14.0
pkgrel=1
pkgdesc="A command driven spotify player."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/aome510/spotify-player"
license=('MIT')
depends=('alsa-lib' 'openssl')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aome510/spotify-player/archive/v${pkgver}.tar.gz")
sha512sums=('38a76271f76c6b4bae1507e313b689c914c3883f3dea89f242bc1d3fead5233dcc35f08501a28f6880cbc1f97ed44f067ef01ae53a14065e3f1d8f03d6f56e8c')

build() {
	cd "${pkgname}-${pkgver}"

	cargo build --release --locked
}

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm755 target/release/spotify_player -t "${pkgdir}/usr/bin"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: Sophie Tauchert <sophie@999eagle.moe>

pkgname=playlist-sync
pkgver=0.2.2
pkgrel=1
pkgdesc="Tool to sync playlists between music folders."
arch=('x86_64')
url="http://gitlab.com/999eagle/playlist-sync"
license=('GPL3')
depends=('gcc-libs' 'xz')
makedepends=('cargo')
provides=()
source=("https://gitlab.com/999eagle/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('d72152dbae7b1b8813ce98510c760d4cd4913ca4d7ddbfb5c4f922768292f670')

build() {
	cd "${pkgname}-v${pkgver}"
	cargo build --release --locked
}

package() {
	cd "${pkgname}-v${pkgver}"
	install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}

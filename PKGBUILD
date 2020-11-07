# Maintainer: Sophie Tauchert <sophie@999eagle.moe>

pkgname=playlist-sync
pkgver=0.2.0
pkgrel=1
pkgdesc="Tool to sync playlists between music folders."
arch=('x86_64')
url="http://gitlab.com/999eagle/playlist-sync"
license=('GPL3')
depends=('gcc-libs' 'xz')
makedepends=('cargo')
provides=()
source=("https://gitlab.com/999eagle/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('c8924c43729f3fde96a12d279867ef4d730c5edaf4ef18c2c3968b10b9dd4b9d')

build() {
	cd "${pkgname}-v${pkgver}"
	cargo build --release --locked
}

package() {
	cd "${pkgname}-v${pkgver}"
	install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}

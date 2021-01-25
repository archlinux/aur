# Maintainer: Sophie Tauchert <sophie@999eagle.moe>

pkgname=playlist-sync
pkgver=0.2.3
pkgrel=1
pkgdesc="Tool to sync playlists between music folders."
arch=('x86_64')
url="http://gitlab.com/999eagle/playlist-sync"
license=('GPL3')
depends=('gcc-libs' 'xz')
makedepends=('cargo')
provides=()
source=("https://gitlab.com/999eagle/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('72eb29e8f2ee12a9c4e4948ea05516b5619d94d0186cee5664534662e0a51dcf')

build() {
	cd "${pkgname}-v${pkgver}"
	cargo build --release --locked
}

package() {
	cd "${pkgname}-v${pkgver}"
	install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}

# Maintainer: Sophie Tauchert <sophie@999eagle.moe>

pkgname=playlist-sync
pkgver=0.2.1
pkgrel=1
pkgdesc="Tool to sync playlists between music folders."
arch=('x86_64')
url="http://gitlab.com/999eagle/playlist-sync"
license=('GPL3')
depends=('gcc-libs' 'xz')
makedepends=('cargo')
provides=()
source=("https://gitlab.com/999eagle/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('865cf92fae5d954744e270d57f092eaa64082995710af763725c45b717afbe6f')

build() {
	cd "${pkgname}-v${pkgver}"
	cargo build --release --locked
}

package() {
	cd "${pkgname}-v${pkgver}"
	install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}

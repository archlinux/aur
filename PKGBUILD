# Maintainer: Sophie Tauchert <sophie@999eagle.moe>

pkgname=playlist-sync
pkgver=0.2.4
pkgrel=1
pkgdesc="Tool to sync playlists between music folders."
arch=('x86_64')
url="http://gitlab.com/999eagle/playlist-sync"
license=('GPL3')
depends=('gcc-libs' 'xz')
makedepends=('cargo')
provides=()
source=("https://gitlab.com/999eagle/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('6d0378e543510bb913aafae00138f98ee0aeed03bac5bdd674c03c51829495c7')

build() {
	cd "${pkgname}-v${pkgver}"
	cargo build --release --locked
}

package() {
	cd "${pkgname}-v${pkgver}"
	install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}

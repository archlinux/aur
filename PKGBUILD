# Maintainer: Charlotte Lewer <dev@chlvr.net>

pkgname=fortune-mod-anarchism
pkgver=1.8.0
pkgrel=2
pkgdesc="Anarchist fortune quotes"
arch=('any')
url="https://notabug.org/PangolinTurtle/BLAG-fortune"
license=('custom:public domain')
depends=('fortune-mod')
groups=('fortune-mods')
source=(${pkgname}-${pkgver}.tar.gz::https://notabug.org/PangolinTurtle/BLAG-fortune/archive/${pkgver}.tar.gz)
sha256sums=(669b37d85d0617a7c411274eb371cd26453b3c41731abadc7abf2a29b515569e)

build() {
	cd "${srcdir}/blag-fortune"
	make
}

package() {
	cd "${srcdir}/blag-fortune"
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -dm755 -- "${pkgdir}/usr/share/fortune"
	install -m644 -- anarchism anarchism.dat "${pkgdir}/usr/share/fortune"
}

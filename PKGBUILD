# Maintainer: Charlotte Lewer <dev@chlvr.net>

pkgname=fortune-mod-anarchism
pkgver=1.9.0
pkgrel=2
pkgdesc="Anarchist fortune quotes"
arch=('any')
url="https://packages.debian.org/source/testing/blag-fortune"
license=('custom:public domain')
depends=('fortune-mod')
groups=('fortune-mods')
source=(${pkgname}-${pkgver}.tar.gz::http://deb.debian.org/debian/pool/main/b/blag-fortune/blag-fortune_${pkgver}.orig.tar.gz)
sha256sums=(2d35182e9496bc58103bdb6d2636e18f04e2b78bbfc6ea51d04924872859829a)

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

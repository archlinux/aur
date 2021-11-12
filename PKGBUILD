# Maintainer: zapp-brannigan <fuerst.reinje@web.de>
pkgname=webcord-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="A Discord web-based client made with the Electron API, developed with Electron Forge."
arch=('x86_64')
url="https://github.com/SpacingBat3/WebCord"
license=('MIT')
depends=()
provides=("webcord-bin")
conflicts=("webcord" "webcord-git")
source=("${url}/releases/download/v${pkgver}/webcord_${pkgver}_amd64.deb")
sha512sums=('5396770ab8380281d75d6ee43e43643096c967ec91011b2b6f22a59f5985ce499d8815952d1a9159389a3c946f5c322f03fedb1f0675885c9cdd629c8911c639')

package() {
	bsdtar -xf "${srcdir}/webcord_${pkgver}_amd64.deb" -C "${srcdir}" --include data.tar.xz
	bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}
	install -d ${pkgdir}/usr/bin/
}

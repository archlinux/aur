# Maintainer: zapp-brannigan <fuerst.reinje@web.de>
pkgname=webcord-bin
pkgver=2.0.1
pkgrel=1
pkgdesc="A Discord web-based client made with the Electron API, developed with Electron Forge."
arch=('x86_64')
url="https://github.com/SpacingBat3/WebCord"
license=('MIT')
depends=()
provides=("webcord-bin")
conflicts=("webcord-git")
source=("${url}/releases/download/v${pkgver}/webcord_${pkgver}_amd64.deb")
sha512sums=('91adc836e47e8e7a49051d4246861ca8542337bf4af7e191461ac8774f0a58649f288b483698c38c3b1632ac6d95e9404052c054e623d8974d76ccda081d1474')

package() {
	bsdtar -xf "${srcdir}/webcord_${pkgver}_amd64.deb" -C "${srcdir}" --include data.tar.xz
	bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}
	install -d ${pkgdir}/usr/bin/
}

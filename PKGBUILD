# Maintainer: Scarecrow928 <yushuaibin999 at gmail dot com>

pkgname=poi-bin
_pkgname=poi
pkgver=12.0.1
pkgrel=1
pkgdesc="Scalable KanColle browser and tool"
arch=('x86_64')
url="https://github.com/poooi/poi/"
license=('MIT')
provides=("poi")
depends=('nss' 'gtk3')
conflicts=('poi')
options=(!strip)
source=("https://github.com/poooi/poi/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('d2b7f0d738ead04b13af90cf52f2830ead6cb8435cd9cd7a8d6d9d2f028126ee')

package() {
	bsdtar -xf data.tar.xz -C "$pkgdir/"
	chmod 4755 "${pkgdir}/opt/${_pkgname}/chrome-sandbox"
	mkdir -p "${pkgdir}/usr/bin"
	ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

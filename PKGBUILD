# Maintainer: Scarecrow928 <yushuaibin999 at gmail dot com>

pkgname=poi-bin
_pkgname=poi
pkgver=11.0.0
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
sha256sums=('1f595f4644c8b77125eaae487f4b11eaadb51265745027f94ae242d5e71d6eb6')

package() {
	bsdtar -xf data.tar.xz -C "$pkgdir/"
	chmod 4755 "${pkgdir}/opt/${_pkgname}/chrome-sandbox"
	mkdir -p "${pkgdir}/usr/bin"
	ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

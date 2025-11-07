# Maintainer: Scarecrow928 <yushuaibin999 at gmail dot com>

pkgname=poi-bin
_pkgname=poi
pkgver=11.1.0
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
sha256sums=('be42bbcdd815836dbf16aa7021eb96a26019be4a6e8a44f81b3a241f31782e80')

package() {
	bsdtar -xf data.tar.xz -C "$pkgdir/"
	chmod 4755 "${pkgdir}/opt/${_pkgname}/chrome-sandbox"
	mkdir -p "${pkgdir}/usr/bin"
	ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

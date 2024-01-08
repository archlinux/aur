# Maintainer: Scarecrow928 <yushuaibin999@gmail.com>

pkgname=poi-bin
_pkgname=poi
pkgver=11.0.0
_pkgver="${pkgver}-beta.5"
pkgrel=1
pkgdesc="Scalable KanColle browser and tool"
arch=('x86_64')
url="https://github.com/poooi/poi/"
license=('MIT')
provides=("poi")
depends=('nss' 'gtk3')
conflicts=('poi')
options=(!strip)
source=("https://github.com/poooi/poi/releases/download/v${_pkgver}/${_pkgname}_${_pkgver}_amd64.deb")
sha256sums=('7e979f958dca1aa78852301e1d842c2f05b4170295fcfa1538258865f573dd91')

package() {
	bsdtar -xf data.tar.xz -C "$pkgdir/"
	chmod 4755 "${pkgdir}/opt/${_pkgname}/chrome-sandbox"
	mkdir -p "${pkgdir}/usr/bin"
	ln -s "${pkgdir}/opt/${_pkgname}/${_pkgname}" "/usr/bin/${_pkgname}"
}

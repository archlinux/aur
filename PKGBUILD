# Maintainer: Scarecrow928 <yushuaibin999 at gmail dot com>

pkgname=poi-bin
_pkgname=poi
pkgver=11.0.0.beta.6
_pkgver="11.0.0-beta.6"
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
sha256sums=('ffc29d129b1dd528c51acdf5ac883f69cfe9ea476e10d0cc77b38d182643ed02')

package() {
	bsdtar -xf data.tar.xz -C "$pkgdir/"
	chmod 4755 "${pkgdir}/opt/${_pkgname}/chrome-sandbox"
	mkdir -p "${pkgdir}/usr/bin"
	ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

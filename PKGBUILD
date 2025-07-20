# Maintainer: Scarecrow928 <yushuaibin999 at gmail dot com>

pkgname=poi-bin
_pkgname=poi
pkgver=11.0.0.beta.9
_pkgver="11.0.0-beta.9"
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
sha256sums=('2e34ed34d0065e5d1aa17ac271f60080ef85297d87fdddf53e3c87135c2bf417')

package() {
	bsdtar -xf data.tar.xz -C "$pkgdir/"
	chmod 4755 "${pkgdir}/opt/${_pkgname}/chrome-sandbox"
	mkdir -p "${pkgdir}/usr/bin"
	ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

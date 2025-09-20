# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=noborus
_pkgname=ovcs
pkgname=${_pkgname}-bin
pkgver=0.16.1
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="The client/server of the terminal pager ov"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

depends=('ov')
provides=("${_pkgname}")
conflicts=("${_pkgname}"{,-git})

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.zip::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_linux_${_barch[0]}.zip")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.zip::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_linux_${_barch[1]}.zip")
sha256sums_x86_64=('81f652b76e538907577d0946640492f24fdd8c2ca5dd66c9ae1101fb301f103b')
sha256sums_aarch64=('3b7319ca20825f5f8ffc24b45240fa3b65825e8f056d1c786abc336ac148e316')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

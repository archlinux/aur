# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=dredge
_pkgauthor=DeprecatedLuar
_pkgname=dredge-cargo
pkgname=${_appname}-bin
pkgdesc="Backed-up personal encrypted vault for the terminal"

pkgver=0.10.1
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

depends=('glibc')
provides=("${_appname}")
conflicts=("${_appname}" "${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_appname}_${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_appname}_${_barch[1]}")
sha256sums=('058ddc22892eb71794d964b39ac41c8a8f1c9324cf4521c87c3486ca41c40a77'
            'ce37bb083947186acb712a9cb01d81357f3b303b35db4119519361ee198b4b3e')
sha256sums_x86_64=('641bd2018e99e16577b2af513c673a5dc2cf89888535911458e533a849693a4d')
sha256sums_aarch64=('d6fbde381ee72baaac6a4c2316755e556fcdaf51acde8765f7a4ef78c553039a')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

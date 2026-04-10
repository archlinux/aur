# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=dredge
_pkgauthor=DeprecatedLuar
_pkgname=dredge-cargo
pkgname=${_appname}-bin
pkgdesc="Backed-up personal encrypted vault for the terminal"

pkgver=0.9.10
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
sha256sums=('9a2806678470b26a0cde4bf00b24eac3d918f6614b7a3e5400d3b78070a8ec5a'
            'ce37bb083947186acb712a9cb01d81357f3b303b35db4119519361ee198b4b3e')
sha256sums_x86_64=('c4e3326b7b4846cece9c97494c1b851496fb72b6fd6a482ee6cc4614f9cd753c')
sha256sums_aarch64=('912e2f7869ba2d0c1650f98968958cf61f3b33f2665c79f838a1ffef13b38452')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

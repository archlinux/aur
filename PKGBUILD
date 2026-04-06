# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=dredge
_pkgauthor=DeprecatedLuar
_pkgname=dredge-cargo
pkgname=${_appname}-bin
pkgdesc="Backed-up personal encrypted vault for the terminal"

pkgver=0.9.8
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
sha256sums=('42c8e35367453dcf76146f180c1023b7cf6cbf86838e3da4fa92143b0779a02d'
            'ce37bb083947186acb712a9cb01d81357f3b303b35db4119519361ee198b4b3e')
sha256sums_x86_64=('c848f23cb5d80e28594479dcb76d04ae641c54c2d84a4394bee174869126c1f2')
sha256sums_aarch64=('86160cfaa8d767c49197fb2dc4a872a4400afb9c259c504b35134bf4aa7fe088')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

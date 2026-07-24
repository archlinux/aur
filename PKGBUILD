# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=dredge
_pkgauthor=DeprecatedLuar
_pkgname=dredge-cargo
pkgname=${_appname}-bin
pkgdesc="Backed-up personal encrypted vault for the terminal"

pkgver=0.11.1
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
sha256sums=('e0354014149bb532a8ef4845b946f8cd937b626eb7ec63e561f818e2ff5354dd'
            'ce37bb083947186acb712a9cb01d81357f3b303b35db4119519361ee198b4b3e')
sha256sums_x86_64=('5baa961b50178309a0da669388e1e1b60e9c080acede6b3d4e47a11c3be5efef')
sha256sums_aarch64=('2776f49df7352e946f1eafee55fc79cb4268e73ab1e91114eec1a1420216f51a')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

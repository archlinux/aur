# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=arika0093
_pkgname=console2svg
pkgname=${_pkgname}-bin
pkgdesc="Easily convert terminal output into SVG images"

pkgver=0.6.5
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x64' 'linux-arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('Apache-2.0')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}")
sha256sums=('8523070b6792ebe6ed0d38fad9c5e489aac6175da8d57b9c52de2ba35214ce99'
            '98777468c101698f56a7e16011578e44db2c1fb6c5b70f614f1fc3be6d551d36')
sha256sums_x86_64=('5455a4556771d64ca8fd9665e7a764e97921bcc5a5cd2ede2bbd11fe81c18b33')
sha256sums_aarch64=('d29a1ab3d091f8fd1ed386b3524f271f401604df4b96a6bf0539e15086a5a2ae')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

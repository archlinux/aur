# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=marcosnils
_pkgname=bin
pkgname=${_pkgname}-bin
pkgver=0.25.0
pkgrel=1
pkgdesc=" Effortless binary manager"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${pkgver}-${arch[0]}::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_${_barch[0]}")
source_aarch64=("${_pkgname}-${pkgver}-${arch[1]}::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_${_barch[1]}")
sha256sums=('73624cfa33d3785e80ae8d5402f9857396c0cb3e9d945615a603b50eb0d04a99'
            '81d442bab54112d522a0595feff10840bf8be21893a3569c705c5f30bf57646b')
sha256sums_x86_64=('b6627c1ded85f9c52e9985dc1731e9a105330f6421a8cf70d4a55f36c1c3739d')
sha256sums_aarch64=('f060dd659a69cb84b36d6d0e35da64f20e209d30759afb2209a90180055ae4dc')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

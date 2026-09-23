# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=marcosnils
_pkgname=bin
pkgname=${_pkgname}-bin
pkgver=0.29.4
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
            '3740add25fb877968016163dac1715ac1c0a13a9fed0d09534a8a4a772395b41')
sha256sums_x86_64=('f7a179a813675bde2d8cf0ad3b4ae1d7bb1c6732daf623fb8deeba9f5f4782a7')
sha256sums_aarch64=('706d5576d64f4ce66136f866cf51b92b2d0c2cc087e2cd17f32cd390b68e52cf')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=marcosnils
_pkgname=bin
pkgname=${_pkgname}-bin
pkgver=0.29.1
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
            '16d4100ec96bc48c0af025daeb9be9f348b523f54e3fedf6ae6c8efa93dd950b')
sha256sums_x86_64=('f338bf89c500b348644a9a49b99adc4748e69b1c85ed43c463356847a1e1aa8b')
sha256sums_aarch64=('bf07c65837682499b484b68c9c7613fc6ffba3546f459f8f8043e7c884773dd6')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

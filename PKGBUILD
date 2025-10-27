# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=marcosnils
_pkgname=bin
pkgname=${_pkgname}-bin
pkgver=0.24.1
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
            '13260ae768e4c5a330397e8e2cc14a849bf6b1d0687823a5371fc9ba09a98638')
sha256sums_x86_64=('79da3c1530f533e430e852814adbbc8a21bf1c393ed4a32842c883d9a08ecc6f')
sha256sums_aarch64=('670fe3915bd5fdbd7dce70ccc585648c9e542f58b3481c0e58bca0830822164d')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

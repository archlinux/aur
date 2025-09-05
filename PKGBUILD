# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=mikeleppane
_pkgname=chamber
pkgname=${_pkgname}-bin
pkgver=0.5.3
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="A secure, local-first secrets manager"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[1]}")
sha256sums=('21fb5a5395f0f650feb3688f00c858e59eefa51c3c945a19da2c3ed2a4d8a3d2'
            '0e6b3737c358765050515693144e9e652c22baadd667aede8e17fc661998127b')
sha256sums_x86_64=('606f26840815bcd600117b326c9318c86a920186c15cab868c8036cf94ad848f')
sha256sums_aarch64=('e57e970149d8d5edfdef31f261460fd5ad6f960eb550927de06e526e35e9d950')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

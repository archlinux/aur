# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=VirusTotal
_pkgname=yara-x
_pkgbin=yr
pkgname=${_pkgname}-bin
pkgver=1.22.1
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="A pure Rust implementation of YARA"
arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('BSD-3-Clause')

provides=("${_pkgbin}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[0]}-unknown-linux-gnu.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[1]}-unknown-linux-gnu.tar.gz")
sha256sums=('fdf05444c9178e662fa28810d94a1fa6ec32d7be798241c98094213317265880'
            'fe5c6f9fde50171d930617d0d21daec6ce089dd9b02853662f5a41dd614ee109')
sha256sums_x86_64=('c0ff80408d57b94f8348b9b19b5c70fb03e6471e7fdd761c97e0b4876804eecf')
sha256sums_aarch64=('bdddb06ca550319c26aab57d2ee0ea792b0a5175565b22f1ba04813937450fb7')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgbin}" "${pkgdir}/usr/bin/${_pkgbin}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: Ranadeep B < mail at rnbguy dot at >
# Contributor: Ranadeep B < mail at rnbguy dot at >

_pkgname=universal-sierra-compiler
pkgname=${_pkgname}-bin
_orgname=software-mansion
_github=${_orgname}/${_pkgname}
pkgver=2.10.3
pkgrel=1
pkgdesc='Compiler for any ever-existing Sierra version to CASM'
arch=('x86_64' 'aarch64')
url="https://github.com/${_github}"
license=('MIT')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("https://github.com/software-mansion/universal-sierra-compiler/raw/master/LICENSE")
source_x86_64=("https://github.com/${_github}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/${_github}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('1807f58ed3955e8fc9867b5eb6d20209d1eb22b8d366c54a6283e569697e3f77')
sha256sums_x86_64=('1e6b91126543efb5861e6dc7a992793c738214d908d2dda4ab104b9459865031')
sha256sums_aarch64=('53b1a997f079a4313e135001f04a480ebd6b82d6bf2d931c8a73769fa1552ab3')

package() {
	install -Dm755 "${srcdir}/${_pkgname}-v${pkgver}-${CARCH}-unknown-linux-gnu/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


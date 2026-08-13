# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=dlvhdr
_pkgname=gh-enhance
pkgname=${_pkgname}-bin
pkgver=0.7.0
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="A Blazingly Fast Terminal UI for GitHub Actions"
arch=('x86_64' 'i686' 'aarch64')
_barch=('amd64' '386' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_${_pkgvername}_linux-${_barch[0]}")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_${_pkgvername}_linux-${_barch[1]}")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_${_pkgvername}_linux-${_barch[2]}")
sha256sums=('49d78b2c8ba85a6ae0524dbf53f5adf52b92acfa1a506561ba13ac5bcea646d7'
            '2963ff8f76a7cb32c80021856e4626c6fee8a8e48c1c32cb8c21ed2705dc3b44')
sha256sums_x86_64=('7f75df3c6390399546e1be94a79f1a18b0a9b241bc2a719ddf543c5e07822d13')
sha256sums_i686=('c036b7a3f9510c6cd6d8d6101790058e9ce6878e25b3113eb7f23dacd4970a96')
sha256sums_aarch64=('4ef59c3f6a76b8e549548cbce098419e20a0f407db94589bd823c221d4679b21')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

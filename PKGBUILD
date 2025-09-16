# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=stefanlogue
_pkgname=meteor
pkgname=${_pkgname}-bin
pkgver=0.28.2
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="A highly configurable CLI tool for writing conventional commits"
arch=('x86_64' 'i686' 'aarch64')
_barch=('amd64' '386' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[0]}.zip")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[1]}.zip")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[2]}.zip")
sha256sums_x86_64=('9d0b9f65be39ef1fa7fd7b91aca1368d9ce433e87d48728a27fc8c4308a0899a')
sha256sums_i686=('cbdd43c3bf021b76be4c5eb3fbda550107ec77aa36e6b611bb7bee1d5379d480')
sha256sums_aarch64=('974fbd5c8c2dd3f78b335b7f3532febac4642d3a577b61130f5e69b45bdd7054')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

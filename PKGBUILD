# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=thirukguru
_pkgname=localias
pkgname=${_pkgname}-bin
pkgdesc="Local reverse proxy -- stable '.localhost' URLs for development"

pkgver=1.2.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums=('896f6e0b7d1c1779ceef25014f7fee0e106d37729bdd8250a6ca4f0bd5cf9a99')
sha256sums_x86_64=('e8547ff9e93af36f0ab98fe8de70be0b4c92bc9bf5ea048a8897287ed984ebf3')
sha256sums_aarch64=('800ff00da1f0c07e4e282cca8396b3698f9555883c3afd8bb93b1f2cca1a1c52')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

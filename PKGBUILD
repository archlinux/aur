# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=boyter
_pkgname=cs
pkgname=${_pkgname}-bin
pkgdesc="codespelunker - CLI code search tool that understands code structure and ranks results by relevance, with no indexing required"

pkgver=3.0.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'i686' 'aarch64')
_barch=('Linux_x86_64' 'Linux_i386' 'Linux_arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${_barch[0]}.tar.gz")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${_barch[1]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${_barch[2]}.tar.gz")
sha256sums_x86_64=('d12c88a67f611147685308eb3dd1786784390d3717fd11e3417ecb2b95f343b7')
sha256sums_i686=('2194a0c6bd7ff4661dc05229d91ee596cde521952b59de22967b3e8d75422810')
sha256sums_aarch64=('247e875607a4d2a0610b875d4e1d2ac8e5e3b4c2db8f12b2c11e742efb9ab2da')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

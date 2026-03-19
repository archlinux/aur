# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=TheYkk
_pkgname=git-switcher
pkgname=${_pkgname}-bin
pkgdesc="Easily switch between your git profiles"

pkgver=0.6.1
pkgrel=1
_pkgvername=${pkgver}

arch=('x86_64' 'aarch64')
_arch_suffix="unknown-linux-gnu"

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('Apache-2.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs')

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${arch[0]}-${_arch_suffix}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${arch[1]}-${_arch_suffix}.tar.gz")
sha256sums_x86_64=('63a589594ccf6a09cc1d5331deaacb093118a069d3f90a69f05c2a328875dbb7')
sha256sums_aarch64=('d23326cf294adafe2ba008c337fd4cb5e6d3bbc593a3a7064936dd136b8fcb81')


package() {
	cd "${srcdir}/${_pkgname}-${CARCH}-${_arch_suffix}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

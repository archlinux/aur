# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Broderick-Westrope
_pkgname=tetrigo
pkgname=${_pkgname}-bin
pkgver=0.2.0
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="Play Tetris in your terminal."
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('GPL-3.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_linux_${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_linux_${_barch[1]}.tar.gz")
sha256sums_x86_64=('33447244393d15c58e39907b28977cb96b4861e3331d7d6c2d717cc1936aec5b')
sha256sums_aarch64=('b62e409d9222d632c1b2e445c1eec843c54fa9c657f4809a7d53e3d4f970191f')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

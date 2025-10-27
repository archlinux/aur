# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=dlvhdr
_pkgname=gh-dash
pkgname=${_pkgname}-bin
pkgver=4.18.0
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="A beautiful CLI dashboard extension for GitHub to display pull requests and issues with filters you care about"
arch=('x86_64' 'i686' 'aarch64')
_barch=('amd64' '386' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE.txt"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_${_pkgvername}_linux-${_barch[0]}")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_${_pkgvername}_linux-${_barch[1]}")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_${_pkgvername}_linux-${_barch[2]}")
sha256sums=('04451e7f458d16694db2292c0da48139f2787fb68e0784a1021a462e7a2cc342'
            '0e10fa2e579793b1639bf88a25ee8d91e3241f8324c311f7afc7c0d95623eedc')
sha256sums_x86_64=('272eb67ab8f0bbbd2fe96ebeaf9684b86a6fdf95ebdf3e2495b1da8ac0b2c98b')
sha256sums_i686=('1838431cca195cc2eda36ecf3420620778d5b070ce7230b796512ee80b91a8b2')
sha256sums_aarch64=('58c323af89d64f1ac14c01c0be6568325301c494daa65d5129c7158c888786f0')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

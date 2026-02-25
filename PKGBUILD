# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=zihao-liu-qs
_pkgname=treekei
pkgname=${_pkgname}-bin
pkgdesc="A file tree with line counts"

pkgver=0.2.3
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')
_barch=('linux_amd64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${_barch[0]}.tar.gz")
sha256sums=('8efea2ae58678497e5cad9aa8d02bf53c5864da1ff99d28458c1dc9a0ddaf037'
            '28260cf04b56c1359ae421c6222f2bfb1d67475d37e586c66e37b373b252d2ae')
sha256sums_x86_64=('d8dcae7a65589ce9a08654b390735648eb3f3fe39b458530bcd78b1b1dd8ed8a')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

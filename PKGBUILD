# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=zihao-liu-qs
_pkgname=treekei
pkgname=${_pkgname}-bin
pkgdesc="A file tree with line counts"

pkgver=0.3.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums=('3dfd06a4a3c57c91694a6af4c9e9cf9a70ff8563f7459ed12ab57dd00dcf90cd'
            '28260cf04b56c1359ae421c6222f2bfb1d67475d37e586c66e37b373b252d2ae')
sha256sums_x86_64=('60e2136ad6b5d9b2121e90c55f9737247c3d5418188959ce2b315268a40f14f1')
sha256sums_aarch64=('941a3d42a79c59314b359267a710cd08ef4f0482f843fa1f74c1007ecfb279ef')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

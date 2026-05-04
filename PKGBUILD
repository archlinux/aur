# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=charmbracelet
_pkgname=catwalk
pkgname=${_pkgname}-bin
pkgdesc="🐈 A collection of LLM inference providers and models"

pkgver=0.39.5
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
sha256sums=('05fe47a98b45172c2878ec13140f7eb88c87cfdc36dc61e653655cfb2ec874b4'
            '8a77c755a1d1fbdc932e86f0449549121820b6f4cc1234b12fcfc8d38013c1de')
sha256sums_x86_64=('542055fe58cfd8831044573b2887f7a90b5fe1d04702e2300f77023120e4d136')
sha256sums_aarch64=('9ccfde13a5ca750147f8407682ffbeacc53ff83a2ffd2dd0e138ec9240774d23')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

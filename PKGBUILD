# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=charmbracelet
_pkgname=catwalk
pkgname=${_pkgname}-bin
pkgdesc="🐈 A collection of LLM inference providers and models"

pkgver=0.51.3
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
sha256sums_x86_64=('67a7cbe5c2fe434483856747d6e61562ff6096d42c1bfd3a6177d64413c1fb9a')
sha256sums_aarch64=('8468cb8349d71143cc846fb7f650ad8a408c896beeffb5c1341c302d6e035533')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

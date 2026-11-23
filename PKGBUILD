# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=charmbracelet
_pkgname=catwalk
pkgname=${_pkgname}-bin
pkgdesc="🐈 A collection of LLM inference providers and models"

pkgver=3.4.1
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
sha256sums_x86_64=('eb76f3ee466da5a5193f957c14a51ea37c060964d08ef2c2042afb0d642f0c2f')
sha256sums_aarch64=('42d197317b4bcedc02bdd553e50a36ff6781bc9326dfa341f17fb06ebee22039')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

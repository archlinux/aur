# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=raaymax
_pkgname=lazytail
pkgname=${_pkgname}-bin
pkgdesc="A fast, universal terminal-based log viewer with live filtering and follow mode"

pkgver=0.9.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')
_barch=('linux-x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc')

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}.tar.gz")
sha256sums=('37b74f10b5fb35ec654e98b60255198a91496f3945f81fade3ba44924137ab46'
            '5f79f5daf64447f6926cd82dbef4460d4155df60229050fc3e66ddbd9e368325')
sha256sums_x86_64=('b652034030a0a04ee498d5773c36102c545c67a3dd1d99d43eb745d20f6accbb')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

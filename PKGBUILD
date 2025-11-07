# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=j178
_pkgname=chatgpt
pkgname=${_pkgname}-bin
pkgver=1.3.5
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="An elegant interactive CLI for ChatGPT"
arch=('x86_64' 'aarch64')
_barch=('x86_64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_Linux_${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_Linux_${_barch[1]}.tar.gz")
sha256sums=('d612a1f8886ead0a7a1d940d8c15afb71c035ff731ce4e6b8c8ba0454fdd6ad1')
sha256sums_x86_64=('9300540a1ed4bcbf2e6df5ff09cc6c046c4e87e6d78d9d8eb41186aeba792282')
sha256sums_aarch64=('afe8958d24ebaf06e2dcc7c487fd08f2f236868de8aea1bf39f8c5eeb8a8c38f')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

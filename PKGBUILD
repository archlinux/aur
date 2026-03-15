# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Adarsh-codesOP
_pkgname=Klein
pkgname=${_pkgname,,}-bin
pkgdesc="A terminal-based TUI text editor designed to bring the look and functionality of a modern IDE into the terminal"

pkgver=0.5.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('Apache-2.0')

depends=('glibc' 'libgcc')
provides=("${_pkgname,,}")
conflicts=("${_pkgname,,}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[1]}.tar.gz")
sha256sums=('f43de881baf252c016866dd8f207f933564fc8d2d2ff1e2da4437bf5741a9ebe'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('206c0851d37639d3c113f5b5839cc2f80a7ab19c715541fecfa0cb99d8d381cc')
sha256sums_aarch64=('1a22271716a6dc742a8d036b05de70d421f97c53e2e2670f34507d97c3e6b8bc')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname,,}" "${pkgdir}/usr/bin/${_pkgname,,}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

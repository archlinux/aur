# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Adarsh-codesOP
_pkgname=Klein
pkgname=${_pkgname,,}-bin
pkgdesc="A terminal-based TUI text editor designed to bring the look and functionality of a modern IDE into the terminal"

pkgver=0.3.6
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
sha256sums_x86_64=('1f91b0eced6203772de03e57562bb16ff1e44a331058ed7ada78c7625d057318')
sha256sums_aarch64=('a562a44bca4f0cc89930bcaf218a457cc30c6efc14ad15b1353df546235f750d')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname,,}" "${pkgdir}/usr/bin/${_pkgname,,}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=am2rican5
_gitname=sigye
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A beautiful terminal clock with ASCII art fonts"

pkgver=0.5.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.tar.gz")
sha256sums=('a1c8edd4875a9f127b7123cd916c6d5657d4c900c5c9b95e95771c9217deee3b'
            '679f179395bbc24603397c0676553b4ffc57aa64eea701d565a3b8421fc13a1b')
sha256sums_x86_64=('c7f0944825352a5c8606a43f62fcf9b6bc13114da20330e6bcbb452997cb3700')
sha256sums_aarch64=('f369a70d57c7e50221d4e335cf68b79845a93199a9a4ad5b182743cf7fd08afa')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

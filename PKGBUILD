# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=am2rican5
_gitname=sigye
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A beautiful terminal clock with ASCII art fonts"

pkgver=0.6.0
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
sha256sums=('c550a45ed83e5ec9b3d3cf576a59b8ff3aaffb8b5576086e9b40f3bcde0bc7ad'
            '679f179395bbc24603397c0676553b4ffc57aa64eea701d565a3b8421fc13a1b')
sha256sums_x86_64=('0a971b0637ddd5f7bd200b458ce43e8accad6630f53917ce077df44095d8d5bf')
sha256sums_aarch64=('8857d403f214a988bc4074b34d15e0fccd4b89a3eb580f70d1263b0b75e7548c')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

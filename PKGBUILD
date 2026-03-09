# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=mcandre
_pkgname=unmake
pkgname=${_pkgname}-bin
pkgver=0.0.26
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="A makefile linter"
arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-musl' 'aarch64-unknown-linux-musl')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('BSD-2-Clause')

provides=("${_pkgname}")
depends=('glibc' 'gcc-libs')
conflicts=("${_pkgname}"{,-git})

source=("README-${pkgver}.md::${_urlraw}/README.md"
        "LICENSE-${pkgver}::${_urlraw}/LICENSE.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}.tgz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}.tgz")
sha256sums=('a5bd13b1bf00d46e87ea731a7558635f69324de434a0228ab663bb2543c8c074'
            '9f2df22a75788fa52a08051d56dc8b4f0faa590d4df9213731bb383dd25c165d')
sha256sums_x86_64=('5675e748981a9ece2db671565549a1a82ab6dcb51eff5bde2dd3061ca5dcad17')
sha256sums_aarch64=('11bf8154ed09fccaba1bc647985c81a6d57eae40f8b8e530ef72ad3cc3786c21')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

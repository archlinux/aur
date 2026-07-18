# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=mirageglobe
_gitname=scout
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A safe simple readonly TUI to show file changes including git changes"

pkgver=0.9.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux_amd64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('BUSL-1.1')

provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
sha256sums_x86_64=('83fdbf4417c82eb87ccdb7dff4bfdeb13cf97cb7c7dbe9d1f45c682271fa542e')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

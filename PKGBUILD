# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=cKreymborg
_gitname=git-treeflow
_appname=gtf
pkgname=${_gitname}-bin
pkgdesc="A terminal UI for managing git worktrees"

pkgver=0.2.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source_x86_64=("${_gitname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[0]}.tar.gz")
source_aarch64=("${_gitname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('bda9a4c864f7460b3cd6f2fe51caf137a88570eb6006deae25633269ff0736ad')
sha256sums_aarch64=('cedb21c05ad496dfeb98f2dd4b005f548ead30729d799861d3106864bb7c26ff')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=cKreymborg
_gitname=git-treeflow
_appname=gtf
pkgname=${_gitname}-bin
pkgdesc="A terminal UI for managing git worktrees"

pkgver=0.3.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_gitname}")

options=(!strip)

source_x86_64=("${_gitname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[0]}.tar.gz")
source_aarch64=("${_gitname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('37188b295abfa1b7312f9923396c602953e67ea48cff94017361b75261561e0c')
sha256sums_aarch64=('2bf9a3d36297b74374bd2c7dfd8ffb13c12d390633c75f49c4228dadf4e7182d')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=overthinker1127
_gitname=tui-worktree
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A terminal UI for reviewing AI-generated Git worktree changes"

pkgver=1.0.4
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_x86_64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

depends=('git')
provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('83b32eada41008fa68d40dfcebca098de1f9c5bb1612eb76200a976642c68b48')
sha256sums_aarch64=('3101bf4f16ced735da577272f7dd82f2f9a108d67ade58eb07ff48c4a0bdecc2')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

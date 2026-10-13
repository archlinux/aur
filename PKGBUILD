# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=MathiasDrizzy
_gitname=lazymark
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Lazy markdown notes, tasks and a Kanban board in your terminal"

pkgver=1.2.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('c09f0f1d77493a6512d381feee680766641fb8c1afa9572b01eae9e939b8dbb4')
sha256sums_aarch64=('2b02c1bff78612961836337c0283682896cb98607ef72cc4582fee9d1d9df0c2')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

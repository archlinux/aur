# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=susamn
_gitname=podmutt
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A modern, keyboard-driven podcast client (TUI) for Linux and macOS inspired by lazygit and mpdtui"

pkgver=1.4.0
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

depends=()

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('b095b53eb167e8d04d78ee9047dce3f4006f7641c96158fd220f81e638faa41b')
sha256sums_aarch64=('34c817f08995eed4a9321bfa292133b5abc1407e809ce6e1bcaa5a48e44f73fa')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

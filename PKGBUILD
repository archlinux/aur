# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=heartleo
_gitname=hn-cli
_appname=${_gitname%-cli}
pkgname=${_appname}-bin
pkgdesc="Blazing fast, Hacker News CLI (TUI)⚡"

pkgver=0.0.6
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_x86_64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('10367599a85fff4fc1e2aabfe49b824daae42155e2ad32afc20cfb2f3b2e747f')
sha256sums_aarch64=('8acfdc256babdda64be710bd92a27d0c70dc6b9dad1d7ac05539f51c16bac259')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

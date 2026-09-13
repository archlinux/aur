# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=gfazioli
_gitname=octoscope
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Terminal dashboard for GitHub"

pkgver=0.34.3
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('Linux_x86_64' 'Linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('a802a88095c6177a4689a2a0564b55b6bd5851b31b55636ed9a9933581154b18')
sha256sums_aarch64=('c2e579f411e0fdeee4257f039c07b2a8bb9e58a6ce82a30387bbe6b61420dc54')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=gfazioli
_gitname=octoscope
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Terminal dashboard for GitHub"

pkgver=0.10.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('Linux_x86_64' 'Linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('d613966a00e3058f603e6b491760827a52ac9545b8292069982f62e35cbb2c0d')
sha256sums_aarch64=('1f2b0c1df3555b4f995d70841212f6db10cfea9a86f8eafb6e947d23ec803078')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

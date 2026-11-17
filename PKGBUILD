# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=mob3net
_gitname=mob3
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="MOB³ is a compact, self-contained browser for the terminal"

pkgver=2.6.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'i686' 'aarch64')
_barch=('linux_amd64' 'linux_386' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url='https://mob3.net/'

license=('AGPL-3.0')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}_${_gitversion}_${_barch[0]}.tar.gz")
source_i686=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}_${_gitversion}_${_barch[1]}.tar.gz")
source_aarch64=("${_appname}-${arch[2]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}_${_gitversion}_${_barch[2]}.tar.gz")
sha256sums=('312ffeebef6511c6bd774f40dde300226bae63240eece3ccbdbe8b54b8f1ca52'
            '0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0')
sha256sums_x86_64=('71d6e67f87b3aec8977ae2755fee6f5c7af7e02a7fceb25506c11d139ca192e1')
sha256sums_i686=('cb6d63827fc62df6b94052549637b79aadd6c14a7b6465948335687329e9b9f5')
sha256sums_aarch64=('560a7a65fbdfcdb72c8500aac70f087f96cd64ac65dcc691575e619d7c0c70d6')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

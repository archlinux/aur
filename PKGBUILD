# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=NustyFrozen
_gitname=SEE
_appname=seetui
pkgname=${_appname}-bin
pkgdesc="see (Service Event Extraction) is a TUI based tool to lookup logs from services (systemd)"

pkgver=0.1.5
pkgrel=1
_gitversion=${pkgver}

arch=('x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-3.0')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc' 'systemd-libs')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.MD"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}")
sha256sums=('29c1b4288d32151d3220f28bba2d9ee16de545b8d65139989821c57be0ff6f98'
            '605e9047a563c5c8396ffb18232aa4304ec56586aee537c45064c6fb425e44ad')
sha256sums_x86_64=('f184ded6f56179910be41aca63b73acbb95d8609ba5dab9e1778e647c78f6672')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=NustyFrozen
_gitname=SEE
_appname=seetui
pkgname=${_appname}-bin
pkgdesc="see (Service Event Extraction) is a TUI based tool to lookup logs from services (systemd)"

pkgver=0.1.7
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
sha256sums=('6ed0b430625d17efd4db52e6eb49d08bc7622d7315a0a1fa027f5f8a2cd94a1b'
            '605e9047a563c5c8396ffb18232aa4304ec56586aee537c45064c6fb425e44ad')
sha256sums_x86_64=('511f30a72ca62a1062acb3293b9560c7b465d58fd6c0b6f14911b5d9a989baa7')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

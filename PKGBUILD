# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=blacknon
_gitname=childflow
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Per-command-tree network sandbox for Linux"

pkgver=0.8.0
pkgrel=1
_gitversion=${pkgver}

arch=('x86_64')
_barch=('x86_64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc' 'openssl')

options=(!strip)

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}.${_barch[0]}.tar.gz")
sha256sums_x86_64=('c462f2a68d347b164c8af950f4d54e97de8753cf9dad7098f0dbfbe25caa5c0a')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

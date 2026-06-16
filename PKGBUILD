# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=venkatkrishna07
_gitname=mkdev
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Real HTTPS for local dev — with a TUI and LAN sharing"

pkgver=0.4.2
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux_amd64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT' 'BSD-3-Clause')

provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
sha256sums_x86_64=('f43dbb26210453c3283c380875f547bd38a90937db972ccbad800baf97f3f68a')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 "LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

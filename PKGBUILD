# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=venkatkrishna07
_gitname=mkdev
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Real HTTPS for local dev — with a TUI and LAN sharing"

pkgver=0.3.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT' 'BSD-3-Clause')

provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('a91e4e6e69a120aa178db99d455cc19b3d3d29751c83bebc7f5b0de7188420b9')
sha256sums_aarch64=('9a9f414b2628c586ec66814bedc2c6f1d5353f4d10a1d14c00594bf790319865')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 "LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

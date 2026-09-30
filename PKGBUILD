# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=MawCeron
_gitname=lazyftp
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A simple, keyboard-driven TUI FTP, FTPS and SFTP client"

pkgver=0.4.0
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

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('461a30edf9c030c862e430b6b499ac9b80b5a212d1c457208c142a0a376596cb')
sha256sums_aarch64=('fe73902b838a03d22c1a0a65d29a33e4e432a75ad9ffd03247490674568f3b0a')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

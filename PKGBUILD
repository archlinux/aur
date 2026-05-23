# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=venkatkrishna07
_gitname=mkdev
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Real HTTPS for local dev — with a TUI and LAN sharing"

pkgver=0.2.0
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
sha256sums_x86_64=('8167377ffba1dba30151de2f09dce66367d501ce8a90efe4d68c8166fe3cd46b')
sha256sums_aarch64=('4964faece0b2814dec1f839c5490ce927955e9ae405aae06d87f4b3d5e3dd4be')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 "LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

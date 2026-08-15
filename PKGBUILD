# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=programmersd21
_gitname=wlocks
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="📂 See which processes hold your files open: A smooth tui alternative to lsof/fuser with auto-refresh, fuzzy search, sort modes, and themes"

pkgver=0.1.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64' 'armv6h' 'armv7h')
_barch=('linux_amd64' 'linux_arm64' 'linux_armv6' 'linux_armv7')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=(!strip)

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[1]}.tar.gz")
source_armv6h=("${_appname}-${arch[2]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[2]}.tar.gz")
source_armv7h=("${_appname}-${arch[3]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[3]}.tar.gz")
sha256sums_x86_64=('76ec69094d0b886f502a55b7b0115bc697b28ffbcb5ee0ee01e7fdac1cfa62f1')
sha256sums_aarch64=('d67c32bed31e877265e68140b6208d2d841460467c1a0b10abecf35d657c4801')
sha256sums_armv6h=('f01e39bd931af12fd9d65e0fe8115f425993882400017c25a86332e21eb4c7c6')
sha256sums_armv7h=('528cd12effac4c1e3934bca9a556b3e20df4e5b254ade103b43ac32c9cd6b291')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

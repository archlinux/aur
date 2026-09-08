# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=praetorian-inc
_gitname=nerva
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Fast service fingerprinting CLI for 170+ protocols (TCP/UDP/SCTP)"

pkgver=1.69.6
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0')

provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('1cfa91aa984f02f9e0a4bbd712357e7718d69e8004b97c4b554992ae9615dadd')
sha256sums_aarch64=('7fd7f7e5e6917888cb5ec4d8e235fbef4ca729e032001d313e84efbeba299079')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


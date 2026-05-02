# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=janosmiko
_gitname=lfk
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A lightning-fast, keyboard-focused, yazi-inspired terminal user interface for navigating and managing Kubernetes clusters"

pkgver=0.9.38
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

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('ef5e5edbe7209a25534b241abd5ebba775acfcec0953952a32ef35d9cb5d2886')
sha256sums_aarch64=('a0a1276bc210ddc6920999f0bd8f17b5451cbbb78eb4a2eebc00ffa69a083f71')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

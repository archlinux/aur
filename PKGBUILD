# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=janosmiko
_gitname=lfk
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A lightning-fast, keyboard-focused, yazi-inspired terminal user interface for navigating and managing Kubernetes clusters"

pkgver=0.9.15
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
sha256sums_x86_64=('059ff8fad170eeb4434a7d7dc55bd769069973aa3b90e1cb93a672db472e7aa1')
sha256sums_aarch64=('624cd8a8270e15d9d1766b0cddd0248f7da00f3f5bb467ed4a3775e2b08d95b9')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

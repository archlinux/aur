# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=janosmiko
_gitname=lfk
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A lightning-fast, keyboard-focused, yazi-inspired terminal user interface for navigating and managing Kubernetes clusters"

pkgver=0.9.24
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
sha256sums_x86_64=('8cd510657b71d24185575f93a89ee9fd80cc1bba8ee28e88653a51484ed0a395')
sha256sums_aarch64=('84bb2504468181af073dd1f0397a40a4d4527a87fcc90127ed03493180b679b1')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

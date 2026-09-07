# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=codedbysoumyajit
_gitname=KernelView-Go
_appname=kernelview
pkgname=${_appname}-bin
pkgdesc="An ultra-fast, aesthetic system information fetcher and real-time terminal telemetry dashboard"

pkgver=1.3.3
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('4b1c970672f076528dfa278966e807b1b8ddcf92ad00a75d3942ac46d0bf0321')
sha256sums_aarch64=('709b8a52be8c31fe09d8d92bdad7ddb20c3d90dfca7054087230c0b798d18fc4')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=andyrewlee
_gitname=amux
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="TUI for easily running parallel coding agents"

pkgver=0.0.19
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

options=(!strip)

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
sha256sums_x86_64=('bc3097f4a18faa1c3893fac4ecc33f926274e6444a336e975740b48100c26cb1')
sha256sums_aarch64=('bc3097f4a18faa1c3893fac4ecc33f926274e6444a336e975740b48100c26cb1')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

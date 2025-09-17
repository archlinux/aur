# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=siddhantac
_pkgname=puffin
pkgname=${_pkgname}-bin
pkgver=2.1.5
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="TUI for hledger to manage personal finances"
arch=('x86_64' 'i686' 'aarch64')
_barch=('x86_64' 'i386' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

depends=('hledger')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_Linux_${_barch[0]}.tar.gz")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_Linux_${_barch[1]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_Linux_${_barch[2]}.tar.gz")
sha256sums_x86_64=('3c84692d9fc360004f4cc969eee0c4c8a8d9c8e035e271d9a2b150fa30e9b9c8')
sha256sums_i686=('4da849c6fc433594b66d8633d1d222db5dce518e1d0252e9977a5e940f2d8a2d')
sha256sums_aarch64=('a77b5ee0684cffbc053126e17ee7e06846bd394931a42d3d5e1ce228db1e8d38')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

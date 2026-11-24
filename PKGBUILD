# Maintainer: Omansh Krishn <omansh@duck.com>

_pkgname=aria2-next
pkgname=${_pkgname}-bin
pkgver=3.1.2
pkgrel=1
pkgdesc="aria2 fork with extensive bug fixes and modernized architecture (binary version)"
arch=('x86_64' 'aarch64')
url="https://github.com/AnInsomniacy/aria2-next"
license=('GPL-2.0-or-later')
depends=( 'gnutls' 'libxml2' 'sqlite' 'c-ares' 'ca-certificates' 'libssh2' )
provides=("${_pkgname}" "${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")

source_x86_64=( "${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x86_64" )
source_aarch64=( "${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-aarch64" )

sha256sums_x86_64=('6f7e33935a80a2561b9748ebe03da718f9ee9f0a1ae636e8e5975a45b7ab98b7')
sha256sums_aarch64=('99efd3319eb7a3010dbe72953378c1b6f6be9a4b4302dcb8135314dd084d4845')

package() {

	install -dm755 "${pkgdir}/usr/bin"
	install -Dm755 "${srcdir}/${_pkgname}-${pkgver}-linux-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
	ln -s "/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/aria2n"

}

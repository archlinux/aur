# Maintainer: Omansh Krishn <omansh@duck.com>

_pkgname=aria2-next
pkgname=${_pkgname}-bin
pkgver=2.4.9
pkgrel=1
pkgdesc="aria2 fork with extensive bug fixes and modernized architecture (binary version)"
arch=('x86_64' 'aarch64')
url="https://github.com/AnInsomniacy/aria2-next"
license=('GPL-2.0-or-later')
depends=( 'gnutls' 'libxml2' 'sqlite' 'c-ares' 'ca-certificates' 'libssh2' )
provides=("${_pkgname}" "${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")

# https://github.com/AnInsomniacy/aria2-next/releases/download/v2.4.9/aria2-next-2.4.9-linux-aarch64
# https://github.com/AnInsomniacy/aria2-next/releases/download/v2.4.9/aria2-next-2.4.9-linux-x86_64

source_x86_64=( "${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x86_64" )
source_aarch64=( "${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-aarch64" )

sha256sums_x86_64=('06631c9d319f922b474a4e8d908741ee4b34d11d94b13313dafe6e65d11fcb85')
sha256sums_aarch64=('d1ad6a3b36dbb603b8c6c2d7d3bc0af318c9774d25bed738f9738a4caf093b4c')

package() {

	install -dm755 "${pkgdir}/usr/bin"
	install -Dm755 "${srcdir}/${_pkgname}-${pkgver}-linux-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
	ln -s "/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/aria2n"

}

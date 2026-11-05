# Maintainer: Omansh Krishn <omansh@duck.com>

_pkgname=aria2-next
pkgname=${_pkgname}-bin
pkgver=3.0.10
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

sha256sums_x86_64=('f678627620e6da2917252c9e2b34f84e8b902e2de457f77551361e62e8d8eed0')
sha256sums_aarch64=('b9066d5197f2c4ca4082961a904f20f5f8fc0e9be3dd44b7c71e1cd245e78e41')

package() {

	install -dm755 "${pkgdir}/usr/bin"
	install -Dm755 "${srcdir}/${_pkgname}-${pkgver}-linux-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
	ln -s "/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/aria2n"

}

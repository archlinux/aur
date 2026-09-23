# Maintainer: Omansh Krishn <omansh@duck.com>

_pkgname=aria2-next
pkgname=${_pkgname}-bin
pkgver=2.8.1
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

sha256sums_x86_64=('a344c0698d4dc70b9c110bf9363c2bf988322330fd7c81ce75c7d46ea4b5e230')
sha256sums_aarch64=('882f559a359a65db4002d995c146f4fbf6a2b4fb52fefdc83988122803cf93cb')

package() {

	install -dm755 "${pkgdir}/usr/bin"
	install -Dm755 "${srcdir}/${_pkgname}-${pkgver}-linux-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
	ln -s "/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/aria2n"

}

# Maintainer: Omansh Krishn <omansh@duck.com>

_pkgname=aria2-next
pkgname=${_pkgname}-bin
pkgver=3.0.7
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

sha256sums_x86_64=('ba9191b084c0d853b626c1a163bd472e78ef61c9a8498e93f5c6519999dc90a8')
sha256sums_aarch64=('8abfb13eddfc669267fc608fd6b116c483255ea018d033d2448a003b97faeb2b')

package() {

	install -dm755 "${pkgdir}/usr/bin"
	install -Dm755 "${srcdir}/${_pkgname}-${pkgver}-linux-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
	ln -s "/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/aria2n"

}

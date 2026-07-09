# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=amir20
_pkgname=dtop
pkgname=${_pkgname}-bin
pkgver=0.7.8
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="Terminal dashboard for Docker"
arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs')

options=(!strip)

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}-unknown-linux-gnu.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('65e3aeaa044d4d50ca157b6d303ed335f8a305246b22beb154ce003fe0698457')
sha256sums_aarch64=('ddacb0893935e16da0dc7603306e12184701530b108bcd66957af6d677ba97ff')


package() {
	cd "${srcdir}/${_pkgname}-${CARCH}-unknown-linux-gnu/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

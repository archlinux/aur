# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=amir20
_pkgname=dtop
pkgname=${_pkgname}-bin
pkgver=0.2.0
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="Terminal dashboard for Docker"
arch=('x86_64' 'i686' 'aarch64')
_barch=('x86_64' 'i386' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

options=(!strip)

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}_linux_${_barch[0]}.tar.gz")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}_linux_${_barch[1]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}_linux_${_barch[2]}.tar.gz")
sha256sums_x86_64=('c3ec6c9f42895091baf44083d50491ee3c8d6d9c68080fb9afa54a84d4367247')
sha256sums_i686=('dcea7fc991294ca539135c592d730fc6733ce565383fea4fd46944b8a9f48118')
sha256sums_aarch64=('211fe552d49fbf17bb048c11de4be71ae1c916c588615a2ad717c50aaf7838b8')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

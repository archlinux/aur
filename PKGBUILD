# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=bmarse
_pkgname=tododo
pkgname=${_pkgname}-bin
pkgver=0.6.0
_pkgvername=v${pkgver}-stable
pkgrel=1
pkgdesc="The todo manager that should be extinct"
arch=('x86_64' 'i686' 'aarch64')
_barch=('amd64' '386' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-linux-${_barch[0]}.tar.gz")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-linux-${_barch[1]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-linux-${_barch[2]}.tar.gz")
sha256sums_x86_64=('7a99deee06c7a9e0d79e00417e43c8bd94a4f28f7a07679e4526ab28e7af4857')
sha256sums_i686=('05b204d2ebd8bd23bc718cfb0a19a1343e63c9adcf6003c92d78777ced16d0e8')
sha256sums_aarch64=('2d54f8b0175e80679d1bb2c1e268210d7b2e53f3707625d2209582eb6880ee1a')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

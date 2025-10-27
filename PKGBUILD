# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=jmelahman
_pkgname=check-symlinks
pkgname=${_pkgname}-bin
pkgver=0.5.3
pkgrel=1
pkgdesc="Check for broken symlinks"
arch=('x86_64' 'i686' 'aarch64')
_barch=('amd64' '386' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_${_barch[0]}.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_${_barch[1]}.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_${_barch[2]}.tar.gz")
sha256sums_x86_64=('61a852a503a05188297fc70b1344d4ab272050131fa0f9ee4fb51d9f305e8f88')
sha256sums_i686=('1cc49c4a07e0a79dee4533a4fda3deb0a3793c354867d6ff1158e7486adf851e')
sha256sums_aarch64=('183eb7cb24949cb0fcce2766a6fb81f1957e9a675851a19520294578d8bf3a4e')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

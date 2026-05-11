# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appauthor=takashialpha
_appname=swagsh
pkgname=${_appname}-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="A sleek, high-performance Linux shell built in Rust for speed and reliability."
arch=('x86_64')
url="https://github.com/${_appauthor}/${_appname}"
_urlraw="https://raw.githubusercontent.com/${_appauthor}/${_appname}/v${pkgver//_/-}"
license=('Apache-2.0')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc')

install=${_appname}.install

source=("README-${pkgver}.md::${_urlraw}/README.md"
        "LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/${_appname}-v${pkgver}-${arch[0]}-linux.tar.gz")
sha256sums=('235bd302e2e66c213367b7911111eb37eaea59d5ee0ee4a7b8483d076a304864'
            'a24266a5d80f4172e4356c8cdb0b72c0cc884f27afcc7f274a7a6a15eba5f366')
sha256sums_x86_64=('2a074f6c7cdf077c7ef56fb90e0d142233cd388e822ff1c6169a4a6e9a4af5ad')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

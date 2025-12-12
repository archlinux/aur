# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=jcaromiq
_pkgname=goku
pkgname=${_pkgname}-bin
pkgver=2.0.1
pkgrel=1
pkgdesc="HTTP load testing application"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-Linux-musl-${arch[0]}.tar.gz")

sha256sums=('b5f125293d8f7ed90ee6af4e4675e0b6722ba979aa7ac8c77b26cdc5c25b34f6'
            'a466421b5dd4f597715828bdc45c98724195ef5e71a749e445183a6632e6ba8f')
sha256sums_x86_64=('3091ac6fa40589ec1a00c18e6fb2b4eb8a09b86f24c064126bc8384894671576')

package() {
	cd "${srcdir}"

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

	install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
}

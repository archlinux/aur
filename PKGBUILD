# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=jcaromiq
_pkgname=goku
pkgname=${_pkgname}-bin
pkgver=3.0.0
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
            '5884dca06a70339f125bb163bcd873ace383098e0d6dbc22876174b8c7b6c3f4')
sha256sums_x86_64=('e12e9bdf0df078cb09f17914ab368b2601b328e7c99e7d56d0c07d9012dcd9b9')

package() {
	cd "${srcdir}"

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

	install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
}

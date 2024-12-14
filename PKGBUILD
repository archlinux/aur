# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=jcaromiq
_pkgname=goku
pkgname=${_pkgname}-bin
pkgver=1.1.7
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
            '1fc70daf65c5a4171fe82e3258749afd818e2136d9addaef1ef444b7d62b1ace')
sha256sums_x86_64=('66f63db52a3a0ede3b681faf2796eabd1e835d11f8c2ecde77b04f5ef890b43e')

package() {
	cd "${srcdir}"

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

	install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
}

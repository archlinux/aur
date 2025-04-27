# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=jcaromiq
_pkgname=goku
pkgname=${_pkgname}-bin
pkgver=2.0.0
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
            '026d02759d9949024f3f2eee6a0e53890a365e825e43b2217ecf20b0c57d50bc')
sha256sums_x86_64=('e8b601af9a28ebd12d956568d91fde823622411ef74a0e1a6bff3af7ac9d357e')

package() {
	cd "${srcdir}"

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

	install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
}

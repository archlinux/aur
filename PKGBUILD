# Maintainer: Gabriel Rauter <rauter.gabriel@gmail.com>

pkgname=maxcso
pkgver=1.8.0
pkgrel=1
pkgdesc="A fast ISO to CSO compression program for use with PSP and PS2 emulators, which uses multiple algorithms for best compression ratio."
arch=('any')
license=('custom:ISCL')
url="https://github.com/unknownbrackets/maxcso"
depends=('libuv' 'lz4' 'zlib')
makedepends=('gcc')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/unknownbrackets/maxcso/archive/v${pkgver}.tar.gz")
sha512sums=('362a2a2a770ec67aefbda5b1fa1e0470a138731e96cc003c15ce8b13be2895504d456ea9a3353c87b3a020ff101239a2ea9ef7c87d9e185eb03c4dd58892c519')

build() {
  make -C "$pkgname-$pkgver"
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}"    "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.md"    "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.md
}

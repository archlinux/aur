# Maintainer: Gabriel Rauter <rauter.gabriel@gmail.com>

pkgname=maxcso
pkgver=1.11.0
pkgrel=1
pkgdesc="A fast ISO to CSO compression program for use with PSP and PS2 emulators, which uses multiple algorithms for best compression ratio."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
license=('custom:ISCL')
url="https://github.com/unknownbrackets/maxcso"
depends=('libuv' 'lz4' 'zlib')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/unknownbrackets/maxcso/archive/v${pkgver}.tar.gz")
sha512sums=('6e1d820d5e530de39ae2733a7050d366c5d584cce401026d34f97117e0ebd11cf81756abb58cb727315f213f74a002a38a716fee265a1ceebdecf7160d56998e')

build() {
  make -C "$pkgname-$pkgver"
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}"    "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.md"    "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.md
}

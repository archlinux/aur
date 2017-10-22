# Maintainer: Gabriel Rauter <rauter.gabriel@gmail.com>

pkgname=maxcso
pkgver=1.9.0
pkgrel=1
pkgdesc="A fast ISO to CSO compression program for use with PSP and PS2 emulators, which uses multiple algorithms for best compression ratio."
arch=('any')
license=('custom:ISCL')
url="https://github.com/unknownbrackets/maxcso"
depends=('libuv' 'lz4' 'zlib' 'gcc-libs')
makedepends=('gcc')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/unknownbrackets/maxcso/archive/v${pkgver}.tar.gz")
sha512sums=('03a508d5b9dc556534162ca04d91e0fc4bc864b08e47894d5ef5b43db6a6901cc983f097a12e8d7c1b0446c967763bd89c859e64abf8ba2ef68f1cb35e4d81a5')

build() {
  make -C "$pkgname-$pkgver"
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}"    "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.md"    "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.md
}

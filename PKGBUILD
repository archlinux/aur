# Maintainer: Gabriel Rauter <rauter.gabriel@gmail.com>

pkgname=maxcso
pkgver=1.10.0
pkgrel=1
pkgdesc="A fast ISO to CSO compression program for use with PSP and PS2 emulators, which uses multiple algorithms for best compression ratio."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
license=('custom:ISCL')
url="https://github.com/unknownbrackets/maxcso"
depends=('libuv' 'lz4' 'zlib' 'gcc-libs')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/unknownbrackets/maxcso/archive/v${pkgver}.tar.gz")
sha512sums=('79e70fce0ea63767f523fca5abbae4e9b14bc29ff7902c69ec77848f1bf1a2e4a9ae03178a5097da9f251f4db0f856224239f94fdb363e094d0375de79de3fbf')

build() {
  make -C "$pkgname-$pkgver"
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}"    "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.md"    "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.md
}

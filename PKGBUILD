# Maintainer: Gabriel Rauter <rauter.gabriel@gmail.com>

pkgname=maxcso
pkgver=1.9.1
pkgrel=1
pkgdesc="A fast ISO to CSO compression program for use with PSP and PS2 emulators, which uses multiple algorithms for best compression ratio."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
license=('custom:ISCL')
url="https://github.com/unknownbrackets/maxcso"
depends=('libuv' 'lz4' 'zlib' 'gcc-libs')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/unknownbrackets/maxcso/archive/v${pkgver}.tar.gz")
sha512sums=('3b9fe3f2e5f3e5764b20de525a6d30b7032c38f851c450998aee48536918f4bc4d0ddea15bf6033557248f06331ef55f217da6766a59179693cd83ed92372670')

build() {
  make -C "$pkgname-$pkgver"
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}"    "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.md"    "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.md
}

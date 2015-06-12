# Contributor: Sebastian Wolf <fatmike303 at gmail.com>

pkgname=gavrasm
pkgver=3.4
_pkgver=34
_pkgver2=3_4
pkgrel=1
pkgdesc="Command line assembler for Atmel AVR microcontrollers with many extended and new features"
arch=(i686 x86_64)
license=("Custom")
url="http://www.avr-asm-tutorial.net/gavrasm"
makedepends=("fpc")
source=("http://www.avr-asm-tutorial.net/${pkgname}/v${_pkgver}/${pkgname}_sources_lin_${_pkgver}.zip")
md5sums=(415cef5b9ec1c14967964b344d7ed733)

build() {
	cd "${srcdir}/Sourcefiles_v${_pkgver2}"
	ln -s gavrlang_en.pas gavrlang.pas
	fpc gavrasm.pas || return 1
}

package() {
	cd "${srcdir}/Sourcefiles_v${_pkgver2}"
	install -D gavrasm $pkgdir/usr/bin/gavrasm
}

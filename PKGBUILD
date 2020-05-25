# Maintainer: Oskar Roesler <oskar@oskar-roesler.de>
pkgname=esp8266-rtos-sdk
pkgver=3.1.2
pkgrel=4
pkgdesc="ESP8266 RTOS SDK"
arch=('x86_64')
url="https://github.com/espressif/ESP8266_RTOS_SDK"
license=('Espressif MIT')
depends=('python2' python2-click python2-pyserial python2-cryptography python2-pyparsing python2-pyelftools-git)
optdepends=('xtensa-lx106-elf-gcc-bin: Toolchain for the ESP8266')
makedepends=('git')
options=(!strip)
source=("https://github.com/espressif/ESP8266_RTOS_SDK/archive/v$pkgver.tar.gz"
	"esp8266-rtos-sdk.sh")
sha256sums=('d9ca98acb1aa6f397f778316efbe3378834803e9360164e746a292b55a291f00'
            '8fd9449b64edd705c635e4a9f482c2a38b877a939ebadaba375f1a3ef06648f3')

package() {
	install -d "$pkgdir"/opt/$pkgname
	cp -af ESP8266_RTOS_SDK-$pkgver/* "$pkgdir"/opt/$pkgname
	install -Dm755 "$srcdir"/esp8266-rtos-sdk.sh "$pkgdir"/etc/profile.d/esp8266-rtos-sdk.sh
}

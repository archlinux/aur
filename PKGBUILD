# Maintainer: Isaac True <isaac.true@gmail.com>

pkgname=stm32cubef4
pkgver=1.13.0
pkgrel=1
pkgdesc="Embedded software for STM32 F4 series. Please login and download en.stm32cubef4.zip from the Upstream URL."
arch=('any')
url="http://www.st.com/web/catalog/tools/FM147/CL1794/SC961/SS1743/LN1897/PF259243"
license=('custom:MCD-ST Liberty SW License Agreement V2')
groups=()
depends=('bash' 
		 'perl')
makedepends=('unzip')
optdepends=('arm-none-eabi-gcc: ARM compiler'
			'arm-none-eabi-gdb: ARM GDB'
			'arm-none-eabi-newlib: ARM bare metal files'
			'arm-none-eabi-binutils: ARM binutils'
			'openocd: STM32F4 firmware flashing')
provides=()
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=('file:///en.stm32cubef4.zip'
		'LICENSE')
noextract=()
sha512sums=('4d4bc1aa99f71ad0ba5100749c48cfbe4214672422ed2ddefca6ff6e1a1bcea2e985032cf18111bedc4a534db58923b242eb77e4125e4c7cda9e0d27a8ebb47b'
            'ebb2626eee93b15f5633f8271898e2b4ed737141d9fe9fe84633a81cbe9bfccdeec5d3a7390c0bac017f1711531b6692f08047973c99c84a642771ee9edba310')
package() {
	install -d "$pkgdir"/opt/"$pkgname"
	mv STM32Cube_FW_F4_V$pkgver/* "$pkgdir"/opt/"$pkgname"/
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

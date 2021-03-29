# Maintainer: Felix Uhl <aur@mail.felix-uhl.de>
# Contributor: Karsten Pufahl <contact@karstenpufahl.de>

pkgname=stm32cubef7
pkgver=1.16.1
pkgrel=1
pkgdesc="Embedded software for STM32 F7 series"
arch=('any')
url="http://www.st.com/content/st_com/en/products/embedded-software/mcus-embedded-software/stm32-embedded-software/stm32cube-embedded-software/stm32cubef7.html"
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
source=('STM32CubeF7-1.16.1.zip::https://github.com/STMicroelectronics/STM32CubeF7/archive/refs/tags/v1.16.1.zip'
		'LICENSE')
noextract=()
sha512sums=('5143a9dcf12d811778ccda6c7d361a5fc8c90f81edef22bec25c31f28e5869e97ccede483787972f20afe581431e434bde1c6612f7749e0eb9f8f3d2be2cce75'
            '56b5435d98843b02ad3b735cce67b37a98e56095e7377710708c8ce9b72fc4451a314109536bcc48229697c054479b422977d337e701a07014c84fcb97cb04d8')
package() {
	install -d "$pkgdir"/opt/"$pkgname"
	mv STM32CubeF7-$pkgver/* "$pkgdir"/opt/"$pkgname"/
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

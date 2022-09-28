#  Maintainer: Blair Bonnett <blair.bonnett@gmail.com>
# Contributor: Felix Uhl <aur@mail.felix-uhl.de>
# Contributor: Karsten Pufahl <contact@karstenpufahl.de>

pkgname=stm32cubef7
pkgver=1.17.0
pkgrel=1
pkgdesc="Embedded software for STM32 F7 series"
arch=('any')
url="http://www.st.com/content/st_com/en/products/embedded-software/mcus-embedded-software/stm32-embedded-software/stm32cube-embedded-software/stm32cubef7.html"
license=(
  'custom:ST SLA0044'
  'Apache'
  'BSD'
  'MIT'
  'Independent JPEG Group License'
)
groups=()
depends=('bash' 'perl' 'python')
optdepends=(
  'arm-none-eabi-gcc: ARM compiler'
  'arm-none-eabi-gdb: ARM GDB'
  'arm-none-eabi-newlib: ARM bare metal files'
  'arm-none-eabi-binutils: ARM binutils'
  'openocd: STM32F4 firmware flashing'
  'stlink: STM32 firmware programmer'
)
options=('!strip')
source=(
  "STM32CubeF7-$pkgver.tar.gz::https://github.com/STMicroelectronics/STM32CubeF7/archive/refs/tags/v$pkgver.zip"
  'SLA0044::http://www.st.com/SLA0044'
)
sha512sums=(
  '772652fc57e958df285ca347438a6539109fbf303629e61d0f0ac261382c3f8988721f3c945465c7d183d94ae86112b8f527bd27bb0ab42775871f3c213cecdf'
  '47277df443f6276534869aaa643397920bf8bfc79222524fed5faf79201af31f36cf1d6f14dd9f47a9800c34bea539d43e74097b1130e8b5d31a32aa72a74745'
)

package() {
  install -d "$pkgdir"/opt/"$pkgname"
  mv STM32CubeF7-$pkgver/* "$pkgdir"/opt/"$pkgname"/
  install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" SLA0044
  mv "$pkgdir/opt/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/COMPONENT_LICENSES.md"
}

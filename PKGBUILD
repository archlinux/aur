# Contributor: Blair Bonnett <blair.bonnett@gmail.com>
# Contributor: Felix Uhl <aur@mail.felix-uhl.de>
# Contributor: Karsten Pufahl <contact@karstenpufahl.de>

pkgname=stm32cuben6
pkgver=1.1.0
pkgrel=1
pkgdesc="Embedded software for STM32 N6 series"
arch=('any')
url="http://www.st.com/content/st_com/en/products/embedded-software/mcus-embedded-software/stm32-embedded-software/stm32cube-embedded-software/stm32cuben6.html"
license=(
  'LicenseRef-SLA0044'
  'Apache-2.0'
  'BSD-3-Clause'
  'MIT'
  'IJG'
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
  "STM32CubeN6-$pkgver.tar.gz::https://github.com/STMicroelectronics/STM32CubeN6/archive/refs/tags/v$pkgver.tar.gz"
  'SLA0044.txt'
)
sha256sums=('5548d1b54e945564976951ff3ae1ebe5e22d4f237372b055db718ffa0c5207c9'
            '55ba65f78747449aef987ef7f4bfe27bf6927c0acdcca5eb5acc77c16d2dcc2e')

package() {
  install -d "$pkgdir"/opt/"$pkgname"
  mv STM32CubeN6-$pkgver/* "$pkgdir"/opt/"$pkgname"/
  install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" SLA0044.txt
  mv "$pkgdir/opt/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/COMPONENT_LICENSES.md"
}

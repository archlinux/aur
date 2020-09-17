dev=4
pkgname="stm32f${dev}-headers"
pkgver=r6.9f5ea7421d22
pkgrel=1
pkgdesc="Headers for STM32F${dev} devices"
url=https://github.com/STMicroelectronics
license=('apache')
source=("git://github.com/STMicroelectronics/STM32CubeF${dev}.git")
md5sums=('SKIP')
arch=('any')

pkgver() {
    cd "${srcdir}/STM32CubeF${dev}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    mkdir -p "${pkgdir}/opt/STM32/STM32F${dev}"

    install STM32CubeF${dev}/Drivers/CMSIS/Device/ST/STM32F${dev}xx/Include/* \
        STM32CubeF${dev}/Drivers/CMSIS/Include/* \
        "${pkgdir}/opt/STM32/STM32F${dev}"
}

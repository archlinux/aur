#Maintainer: Sam Bazley <sambazley@fastmail.com>
dev=L4
pkgname="stm32${dev,,}-headers-git"
pkgver=r8.f93a2f74f8e9
pkgrel=1
pkgdesc="Headers for STM32${dev} devices"
url=https://github.com/STMicroelectronics
license=('apache')
source=("git+https://github.com/STMicroelectronics/STM32Cube${dev}.git")
md5sums=('SKIP')
arch=('any')

pkgver() {
    cd "${srcdir}/STM32Cube${dev}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    mkdir -p "${pkgdir}/opt/STM32/STM32${dev}"

    install STM32Cube${dev}/Drivers/CMSIS/Device/ST/STM32${dev}xx/Include/* \
        STM32Cube${dev}/Drivers/CMSIS/Include/* \
        "${pkgdir}/opt/STM32/STM32${dev}"
}

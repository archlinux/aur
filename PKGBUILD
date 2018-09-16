# Maintainer: Chenss <ufbycd@163.com>

_pkgname=xtensa-lx106-elf-gcc
pkgname=$_pkgname-bin
pkgver=1.22.0_88_gde0bdc1_4.8.5
pkgrel=2
pkgdesc="ESP8266 GCC Cross-compiler Toolchain"
arch=('x86_64')
url="https://github.com/espressif/ESP8266_RTOS_SDK"
license=('GPL')
options=(!strip libtool staticlibs emptydirs)
provides=("xtensa-lx106-elf-gcc")
conflicts=("xtensa-lx106-elf-gcc")
depends=('sh')
optdepends=()
install=$_pkgname.install
source=($_pkgname.install
        "$_pkgname.sh"
        "https://dl.espressif.com/dl/xtensa-lx106-elf-linux64-1.22.0-88-gde0bdc1-4.8.5.tar.gz")
sha256sums=('8fa5e234d15686f29b679b6808b2f8971c0e3271859502c295ee8420b6ab0d53'
            '9b9499713cb6911616ded8bd3b82568e9d602540e2ff1ca4d996ff06e80c0c0a'
            '08486ae82e6349b61b83bb2c66f706718638523bd71810f2f2d7b3d17b829a7a')

package() {
  install -d "$pkgdir"/opt/$_pkgname
  cp -af xtensa-lx106-elf/* "$pkgdir"/opt/$_pkgname
  install -Dm755 $_pkgname.sh "$pkgdir"/etc/profile.d/$_pkgname.sh
}

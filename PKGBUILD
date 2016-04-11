# Maintainer: Andrey Tkachenko <andreytkachenko64@gmail.com>

_pkgname=stm32flash
pkgname=stm32flash-git
pkgver=r305.5361ed8
pkgrel=1
pkgdesc='Open source flash program for the STM32 ARM processors using the ST serial bootloader over UART or I2C'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url='http://git.code.sf.net/p/stm32flash/code'
license=('GPLv2')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git://git.code.sf.net/p/stm32flash/code")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  make
}

package() {
  # executable
  cd $_pkgname
  install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
}

# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname=hid-flash
_reponame=STM32_HID_Bootloader
pkgver=2.2.2
pkgrel=1
pkgdesc='Driverless USB HID bootloader and flashing tool for STM32F10X devices'
arch=('x86_64')
url="https://github.com/Serasidis/STM32_HID_Bootloader"
license=('GPL3')
depends=('libusb')
makedepends=()
source=("https://github.com/Serasidis/$_reponame/archive/${pkgver}.tar.gz")

build() {
  cd $_reponame-$pkgver/cli
  make
}

package() {
  cd $_reponame-$pkgver/cli
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}

sha256sums=('5e0c1ab26beba27e5ab9c5aa041c53759029e6fea031f01bb7c32b1d9be5ecff')

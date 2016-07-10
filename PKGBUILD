# @Author: Jules <archjules>
# @Date:   2016-07-10T23:16:42+02:00
# @Last modified by:   archjules
# @Last modified time: 2016-07-10T23:41:54+02:00

pkgname='casiousb-git'
pkgver=V0.0.2.r1.gd3663fb
pkgrel=1
arch=('i686' 'x86_64')

depends=('libusb')

source=('git+https://github.com/nessotrin/CasioUsb')
md5sums=('SKIP')

pkgver() {
  cd CasioUsb;
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd CasioUsb;
  make;
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp CasioUsb/CasioUsbUploader/build/CasioUsbUploader "$pkgdir/usr/bin/casiousb"
}

# Maintainer: Ivan Wu <2967948168@qq.com>
pkgname=deepin-boot-maker
pkgver=1.9.0
pkgrel=1
pkgdesc="Deepin Boot Maker is a tool that helps user to create a bootable usb stick quick and easy."
arch=('i686' 'x86_64')
url="https://github.com/linuxdeepin/deepin-boot-maker"
license=('GPL')
groups=('deepin-extra')
depends=('qt5-base' 'ttf-ms-fonts' 'parted' 'dosfstools' 'p7zip' 'syslinux' 'mtools')
makedepends=('qt5-base' 'qt5-tools')
source=("https://github.com/linuxdeepin/deepin-boot-maker/archive/$pkgver.tar.gz")
md5sums=('43b516dc6d90dc2864383d91b1378009')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make INSTALL_ROOT="$pkgdir/" install
  install -D src/app/deepin-boot-maker -t $pkgdir/usr/bin
}

# vim:set ts=2 sw=2 et:

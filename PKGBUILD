# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Dominik Heidler <dheidler@gmail.com>

pkgname=libuhd-firmware
pkgver=4.8.0.0
pkgrel=1
pkgdesc="Universal Software Radio Peripheral (USRP) userspace firmware"
arch=('any')
url="https://files.ettus.com/manual/"
license=('GPL-3.0-or-later')
depends=('libuhd')
source=("https://github.com/EttusResearch/uhd/releases/download/v$pkgver/uhd-images_$pkgver.tar.xz")
sha256sums=('602ee2b9806d5d9ae40a9b068e55ba084e6becea51fdbd956d1f0229d553bf44')

package() {
  cd "$srcdir/uhd-images_$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -d "$pkgdir/usr/share/uhd/images/"
  # multiple types of yuck
  rm -r winusb_driver
  cp -r * "$pkgdir/usr/share/uhd/images/"
}


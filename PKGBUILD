# Maintainer: Robert Falkenberg <robert.falkenberg@tu-dortmund.de>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Dominik Heidler <dheidler@gmail.com>

pkgname=libuhd-firmware3
pkgver=3.15.0.0
pkgrel=1
pkgdesc="Universal Software Radio Peripheral (USRP) userspace firmware"
arch=('any')
url="https://www.ettus.com/kb/category/software-documentation/uhd-manual"
license=('GPL')
depends=('libuhd3')
provides=('libuhd-firmware=3.15.0.0')
conflicts=('libuhd>3.15.0.0')
source=("https://github.com/EttusResearch/uhd/releases/download/v$pkgver/uhd-images_$pkgver.tar.xz")
md5sums=('438c3ae14ef05d472bab6f00b5de422a')

package() {
  cd "$srcdir/uhd-images_$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -d "$pkgdir/usr/share/uhd/images/"
  # multiple types of yuck
  rm -r winusb_driver
  cp -r * "$pkgdir/usr/share/uhd/images/"
}


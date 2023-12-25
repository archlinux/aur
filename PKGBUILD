# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Dominik Heidler <dheidler@gmail.com>

pkgname=libuhd-firmware
pkgver=4.6.0.0
pkgrel=1
pkgdesc="Universal Software Radio Peripheral (USRP) userspace firmware"
arch=('any')
url="https://files.ettus.com/manual/"
license=('GPL')
depends=('libuhd')
source=("https://github.com/EttusResearch/uhd/releases/download/v$pkgver/uhd-images_$pkgver.tar.xz")
sha256sums=('a312587fbe9fffb6043cd96bae50ef283bb55a1e51e1435b5e4a350beb00e59d')

package() {
  cd "$srcdir/uhd-images_$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -d "$pkgdir/usr/share/uhd/images/"
  # multiple types of yuck
  rm -r winusb_driver
  cp -r * "$pkgdir/usr/share/uhd/images/"
}


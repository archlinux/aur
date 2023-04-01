# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Dominik Heidler <dheidler@gmail.com>

pkgname=libuhd-firmware
pkgver=4.4.0.0
pkgrel=1
pkgdesc="Universal Software Radio Peripheral (USRP) userspace firmware"
arch=('any')
url="https://files.ettus.com/manual/"
license=('GPL')
depends=('libuhd')
source=("https://github.com/EttusResearch/uhd/releases/download/v$pkgver/uhd-images_$pkgver.tar.xz")
sha256sums=('57c95d5bc6ef6166eb0c0be95a91dc31e2dff58bc5f0f22bb8303234afdbaeee')

package() {
  cd "$srcdir/uhd-images_$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -d "$pkgdir/usr/share/uhd/images/"
  # multiple types of yuck
  rm -r winusb_driver
  cp -r * "$pkgdir/usr/share/uhd/images/"
}


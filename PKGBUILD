# Maintainer: Patrick Ziegler <p.ziegler96 at gmail dot com>
pkgname="notification-mount"
pkgver=1.0.1
pkgrel=1
pkgdesc="Script to show notification for a block device with mount option"
arch=('any')
url="https://github.com/patrick96/$pkgname"
license=('GPL3')
depends=('python' 'python-gobject' 'python-notify2' 'udevil')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=("3cd4421a03e997ae6a99e79851ccfcf8b76a7885821bb982cc59407ea828b138")

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  install -D -m755 "./notification-mount" "$pkgdir/usr/bin/notification-mount"
  install -D -m644 ./examples/notification-mount.service \
    "$pkgdir/usr/lib/systemd/user/notification-mount.service"
}

# vim:set ts=2 sw=2 et:

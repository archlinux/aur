# Maintainer: Todd E Johnson <todd@toddejohnson.net>

pkgname=systemd-metered-connection-dependency
pkgver=0.1
pkgrel=1
pkgdesc="Execute systemd services if current connection is not metered."
arch=('any')
url="https://github.com/jdorel/systemd-metered-connection-dependency"
license=('GPL3')
depends=('systemd')
source=("https://github.com/jdorel/systemd-metered-connection-dependency/archive/$pkgver.tar.gz")
sha256sums=('22d0426da13c785c8be4fb5a0a2be38fe973ece2758e7fdcd419b7e5a715f126')

package() {
  cd "$pkgname-$pkgver"

  install -Dm644 unmetered-connection.service "$pkgdir/usr/lib/systemd/system/unmetered-connection.service"
  install -Dm755 check-metered-connection.sh "$pkgdir/usr/bin/check-metered-connection.sh"
}

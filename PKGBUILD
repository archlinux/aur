# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=pyfan
pkgver=1.6.1
pkgrel=1
pkgdesc='Fan control utilising hwmon and pid'
arch=(any)
url='https://somegit.dev/anonfunc/PyFan'
license=(GPL-3.0-or-later)
depends=(python-yaml python-simple-pid)
optdepends=('lm_sensors: check and load required hwmon modules')
backup=('etc/pyfan')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('c7ff904568196657c78acb1d690b3437b6a5e0cd2eb3355988b618426d6a225e357d26bbe060cf70363114d46ce9d55559d0396f2d793168ddc008a789416f26')

package() {
  cd $pkgname
  install -Dm755 pyfan.py "$pkgdir"/usr/bin/pyfan.py
  install -Dm644 pyfan.service "$pkgdir"/usr/lib/systemd/system/pyfan.service
  install -Dm644 config-example.yaml "$pkgdir"/usr/share/doc/$pkgname/config-example.yaml
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README
}

# vim:set ts=2 sw=2 et:

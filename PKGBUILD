# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=pyfan
pkgver=1.6.1
pkgrel=3
pkgdesc='Fan control utilising hwmon and pid'
arch=(any)
url='https://somegit.dev/anonfunc/PyFan'
license=(GPL-3.0-or-later)
depends=(python-yaml python-simple-pid)
makedepends=(git)
optdepends=('lm_sensors: check and load required hwmon modules')
backup=('etc/pyfan')
source=("git+$url.git#tag=$pkgver")
b2sums=('5189d5d450dddb14ea93ee8d4d157fdd12ea8425b55ce3af9661e501d963b1ebc5bd344a52965b6fb906b77f900d2fdf20a3cdf08434ac3ddb6829544df3884d')

package() {
  cd PyFan
  install -Dm755 pyfan.py "$pkgdir"/usr/bin/pyfan.py
  install -Dm644 pyfan.service "$pkgdir"/usr/lib/systemd/system/pyfan.service
  install -Dm644 config-example.yaml "$pkgdir"/usr/share/doc/$pkgname/config-example.yaml
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README
}

# vim:set ts=2 sw=2 et:

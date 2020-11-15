# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=pyfan
pkgver=1.5
pkgrel=1
pkgdesc="Fan control utilising hwmon and pid"
arch=('any')
url="https://git.harting.dev/anonfunc/PyFan"
license=('GPL3')
depends=('python-yaml' 'python-simple-pid')
optdepends=('lm_sensors: check and load required hwmon modules')
backup=('etc/pyfan')
source=("https://git.harting.dev/anonfunc/PyFan/archive/$pkgver.tar.gz")
sha256sums=('dde67bf6c379c9705a5d00ad2ea438812728cfb136057374ab9115ece2f48bea')

package() {
  cd "$pkgname"

  install -Dm755 pyfan.py "${pkgdir}/usr/bin/pyfan.py"
  install -Dm644 pyfan.service "${pkgdir}/usr/lib/systemd/system/pyfan.service"
  install -Dm644 config-example.yaml "${pkgdir}/usr/share/doc/$pkgname/config-example.yaml"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/$pkgname/README"
}

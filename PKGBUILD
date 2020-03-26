# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=pyfan
pkgver=1.4
pkgrel=1
pkgdesc="Fan control utilising hwmon and pid"
arch=('any')
url="https://git.harting.dev/IdleGandalf/PyFan"
license=('GPL3')
depends=('python-yaml' 'python-simple-pid')
optdepends=('lm_sensors: check and load required hwmon modules')
backup=('etc/pyfan')
source=("https://git.harting.dev/IdleGandalf/PyFan/archive/$pkgver.tar.gz")
sha256sums=('0026289c934af5a20930762f1a210a1be3eb74d100346d641d6ad4a3b315bc41')

package() {
  cd "$pkgname"

  install -Dm755 pyfan.py "${pkgdir}/usr/bin/pyfan.py"
  install -Dm644 pyfan.service "${pkgdir}/usr/lib/systemd/system/pyfan.service"
  install -Dm644 config-example.yaml "${pkgdir}/usr/share/doc/$pkgname/config-example.yaml"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/$pkgname/README"
}

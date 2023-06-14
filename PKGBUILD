# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=pyfan
pkgver=1.6
pkgrel=2
pkgdesc="Fan control utilising hwmon and pid"
arch=('any')
url="https://somegit.dev/anonfunc/PyFan"
license=('GPL3')
depends=('python-yaml' 'python-simple-pid')
optdepends=('lm_sensors: check and load required hwmon modules')
backup=('etc/pyfan')
source=("https://somegit.dev/anonfunc/PyFan/archive/$pkgver.tar.gz")
b2sums=('2e348441bdb0ab6a5c4cb0124666edf712394862eb4a2a12424a405cb2df8b3282d38489351999bc9ee4e343e559ed3958167a18a331b73c6bfe04cf6337902c')

package() {
  cd "$pkgname"

  install -Dm755 pyfan.py "${pkgdir}/usr/bin/pyfan.py"
  install -Dm644 pyfan.service "${pkgdir}/usr/lib/systemd/system/pyfan.service"
  install -Dm644 config-example.yaml "${pkgdir}/usr/share/doc/$pkgname/config-example.yaml"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/$pkgname/README"
}

# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=pyfan
pkgver=1.6
pkgrel=1
pkgdesc="Fan control utilising hwmon and pid"
arch=('any')
url="https://git.harting.dev/anonfunc/PyFan"
license=('GPL3')
depends=('python-yaml' 'python-simple-pid')
optdepends=('lm_sensors: check and load required hwmon modules')
backup=('etc/pyfan')
source=("https://git.harting.dev/anonfunc/PyFan/archive/$pkgver.tar.gz")
b2sums=('858866a2c9b4598eef0b717de491d7c66e799c8d77d461cb7d379d21733c772899d118d2f1a51db4809a7462d0eb45c871c09d05dec9c311ca0b5c70708f1c74')

package() {
  cd "$pkgname"

  install -Dm755 pyfan.py "${pkgdir}/usr/bin/pyfan.py"
  install -Dm644 pyfan.service "${pkgdir}/usr/lib/systemd/system/pyfan.service"
  install -Dm644 config-example.yaml "${pkgdir}/usr/share/doc/$pkgname/config-example.yaml"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/$pkgname/README"
}

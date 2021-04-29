# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=pyfan
pkgver=1.5.1
pkgrel=1
pkgdesc="Fan control utilising hwmon and pid"
arch=('any')
url="https://git.harting.dev/anonfunc/PyFan"
license=('GPL3')
depends=('python-yaml' 'python-simple-pid')
optdepends=('lm_sensors: check and load required hwmon modules')
backup=('etc/pyfan')
source=("https://git.harting.dev/anonfunc/PyFan/archive/$pkgver.tar.gz")
b2sums=('73c6c83aa19922f20fc56bbde339e4d99f8fee585c52fe57a2e92e50cab5c7e9f20b52fd5446f19c68617673e5b68cefa418aae609c63b37d227a869e35760ee')

package() {
  cd "$pkgname"

  install -Dm755 pyfan.py "${pkgdir}/usr/bin/pyfan.py"
  install -Dm644 pyfan.service "${pkgdir}/usr/lib/systemd/system/pyfan.service"
  install -Dm644 config-example.yaml "${pkgdir}/usr/share/doc/$pkgname/config-example.yaml"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/$pkgname/README"
}

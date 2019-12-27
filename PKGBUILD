# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=pyfan
pkgver=1.3
pkgrel=1
pkgdesc="Fan control utilising hwmon and pid"
arch=('any')
url="https://git.harting.dev/IdleGandalf/PyFan"
license=('GPL')
depends=('python-yaml' 'python-simple-pid')
optdepends=('lm_sensors: check and load required hwmon modules')
backup=('etc/pyfan')
source=("https://git.harting.dev/IdleGandalf/PyFan/archive/$pkgver.tar.gz")
sha256sums=('b054e26a6dc4e4000bc9509fb04ae9ad860d7053fb0eec9505bbc46fce4820ff')

package() {
  cd "$pkgname"

  install -Dm755 pyfan.py "${pkgdir}/usr/bin/pyfan.py"
  install -Dm644 pyfan.service "${pkgdir}/usr/lib/systemd/system/pyfan.service"
  install -Dm644 config-example.yaml "${pkgdir}/usr/share/doc/$pkgname/config-example.yaml"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/$pkgname/README"
}

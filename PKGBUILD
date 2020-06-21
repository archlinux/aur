# Maintainer: Tony Fettes <tonyfettes@feihaoxiang2014@gmail.com>
# Contributor: Elrondo46 (https://github.com/Elrondo46)
# Contributor: kounch (https://github.com/kounch)

pkgname=argonone
pkgver=0.2.3
pkgrel=1
pkgdesc="Argon One Service and Control Scripts For Raspberry Pi"
arch=('any')
url='https://download.argon40.com/argon1.sh'
license=('GPL3')
depends=('i2c-tools' 'lm_sensors' 'python>=3.3' 'raspberrypi-userland-aarch64-git')
provides=('argonone')
install=argonone.install
source=("https://files.tonyfettes.com/argonone/${pkgname}-${pkgver}.tar.gz")
md5sums=('bc76b22b074dcd09df0925fa16e0de34')

package() {
  install -Dm755 "${srcdir}"/"${pkgname}"/argonone-config "${pkgdir}"/usr/bin/argonone-config
  install -Dm755 "${srcdir}"/"${pkgname}"/argononed "${pkgdir}"/usr/bin/argononed
  install -Dm755 "${srcdir}"/"${pkgname}"/argononed.py "${pkgdir}"/opt/argonone/bin/argononed.py
  install -Dm755 "${srcdir}"/"${pkgname}"/argononed.shutdown "${pkgdir}"/usr/lib/systemd/system-shutdown/argononed.shutdown
  install -Dm644 "${srcdir}"/"${pkgname}"/argononed.service "${pkgdir}"/usr/lib/systemd/system/argononed.service
  install -Dm666 "${srcdir}"/"${pkgname}"/argononed.conf "${pkgdir}"/etc/argononed.conf
}

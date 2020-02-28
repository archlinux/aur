# Maintainer: Tony Fettes <tonyfettes@tonyfettes.tk>
# Contributor: kounch (https://github.com/kounch)

pkgname=argonone
pkgver=0.2.0
pkgrel=1
pkgdesc="Argon One Service and Control Scripts"
arch=('any')
url='https://download.argon40.com/argon1.sh'
license=('GPL3')
depends=('i2c-tools' 'lm_sensors' 'python>=3.3')
provides=('argonone')
install=argonone.install
source=("https://tonyfettes.tk/download/${pkgname}-${pkgver}.tar.gz")
md5sums=('7915da37cc05718de7adc8595449ec6f')

package() {
  install -Dm755 "${srcdir}"/"${pkgname}"/argonone-config "${pkgdir}"/usr/bin/argonone-config
  install -Dm755 "${srcdir}"/"${pkgname}"/argononed-fan "${pkgdir}"/usr/bin/argononed-fan
  install -Dm755 "${srcdir}"/"${pkgname}"/argononed-powerbutton "${pkgdir}"/usr/bin/argononed-powerbutton
  install -Dm755 "${srcdir}"/"${pkgname}"/argononed.shutdown "${pkgdir}"/usr/lib/systemd/system-shutdown/argononed.shutdown
  install -Dm644 "${srcdir}"/"${pkgname}"/argononed-fan.service "${pkgdir}"/usr/lib/systemd/system/argononed-fan.service
  install -Dm644 "${srcdir}"/"${pkgname}"/argononed-powerbutton.service "${pkgdir}"/usr/lib/systemd/system/argononed-powerbutton.service
  install -Dm666 "${srcdir}"/"${pkgname}"/argononed.conf "${pkgdir}"/etc/argononed.conf
}

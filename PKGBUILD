# Maintainer  : Balazs Vinarz <vinibali1@gmail.com

pkgname='domoticz-bin'
pkgver=2023.2
pkgrel=1
pkgdesc="Web based home automation"
#need to add other architectures and manage to do the string change for armv7h and armhf
arch=('armv7h')
url='https://www.domoticz.com'
conflicts=('domoticz' 'domoticz-git')
license=('GPL3')
depends=('libusb-compat' 'libcurl-gnutls' 'mosquitto')
install='domoticz.install'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/domoticz/domoticz/releases/download/${pkgver}/domoticz_linux_${pkgver}_armhf.tgz"
        'domoticz.service')
sha256sums=()

package() {
  mkdir -p "${pkgdir}"/opt/domoticz
  cp -aRP ${srcdir}/* ${pkgdir}/opt/domoticz
}

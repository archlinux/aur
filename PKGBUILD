# Submitter: Jooch <jooch (at) gmx (dot) com>
# Maintainer: Jooch <jooch (at) gmx (dot) com>
pkgname=openhardwaremonitor
pkgver=0.9.6
pkgrel=1
pkgdesc="An open source program that monitors temperature sensors, fan speeds, voltages, load and clock speeds of a computer."
arch=('any')
url="http://openhardwaremonitor.org/"
license=('custom')
groups=()
depends=('mono')
makedepends=('unzip')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=("http://openhardwaremonitor.org/files/openhardwaremonitor-v${pkgver}.zip"
		"LICENSE"
		"openhardwaremonitor.desktop"
		"openhardwaremonitor.png")
sha1sums=('be8214de9ebe3b9dc7470f3f10321aa2043f20f0'
		  '8ab3769d8ea8fbe53a0288602706040498a4f54b'
		  'e8ce33b638ea1bd379467454eabb60f8ed37c5f3'
		  '5596ef1ea456c9d2c471b5b09cd2f5ffa98a8759')

package() {
  cd "$pkgdir"

  # The license should be in /usr/share/licenses.
  install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Desktop file
  install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m644 "${srcdir}/${pkgname}.png" "${pkgdir}/opt/${pkgname}/${pkgname}.png"

  mkdir -p opt
  touch "${pkgdir}/opt/${pkgname}/OpenHardwareMonitor.config"
  chmod 666 "${pkgdir}/opt/${pkgname}/OpenHardwareMonitor.config"
  cp -a "${srcdir}/OpenHardwareMonitor/." "${pkgdir}/opt/${pkgname}/"
}

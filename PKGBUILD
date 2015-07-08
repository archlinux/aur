# Contributor: OS Hazard  <oshazard+aur@gmail.com>
pkgname=chronos-firmware
pkgver=5.0.7
_srcver=507
_ffpver=5-0-7
pkgrel=2
pkgdesc="Mushkin FW for Atlas, Catalyst, Chronos, Chronos Deluxe, and Chronos MX Sandforce SF-2200 SSDs"
arch=('i686' 'x86_64')
url="http://poweredbymushkin.com/support/ssd-firmware-updates"
license=('unknown')
optdepends=('sandforce-updater: flash firmware')
makedepends=('unzip' 'gzip')
install=$pkgname.install
source=(http://poweredbymushkin.com/firmware/Mushkin_Atlas_Chronos_Catalyst_${_srcver}_FW_Update.zip 
	https://github.com/oshazard/aur-includes/raw/master/chronos-firmware/includes.tar.gz)
md5sums=('d989b290e195aedaec75133f63bf8bb7'
	 '3a8f37a7e2b2e882982b74884eacaa66')

package() {
  cd "$srcdir/Mushkin_Atlas_Chronos_Catalyst_${_srcver}_FW_Update"

  # Install binary
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  install -m644 MKN_FW_${_ffpver}.ffp "${pkgdir}/usr/share/${pkgname}"

  cd "$srcdir/mkn-launcher"

  # Install pixmap and .desktop file
  install -Dm644 "mushkin_file.png" "${pkgdir}/usr/share/pixmaps/mushkin_file.png"
  install -Dm644 "chronos-firmware.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

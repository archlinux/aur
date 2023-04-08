pkgname=ardupilot-mission-planner
pkgver=1.3.80
epoch=2
pkgrel=4  # Todo: reset to 1 when changing the version!
pkgdesc="Full-featured ground station application for the ArduPilot open source autopilot project"
arch=('x86_64')
url="https://github.com/ArduPilot/MissionPlanner"
license=("GPL3")
depends=('mono')

source=("https://firmware.ardupilot.org/Tools/MissionPlanner/MissionPlanner-${pkgver}.zip" ${pkgname}.desktop)

sha256sums=(
  '8a2be56905ad38c247721991f76168a936a8b0627d17502016db8580313ff6a4'
  '39ff90115c509ef661d8f13e0c0384ba8e94f887cd1b4d64b49ece31f8bf4523'
)

package() {
	install -d "${pkgdir}/opt/${pkgname}"
	cp -r ${srcdir}/* ${pkgdir}/opt/${pkgname} -R

  # Mission Planner's .zip file ships without a Linux-compatible .desktop file,
  # so I've made one in this AUR repo to make Mission Planner easier to launch
	install -d "${pkgdir}/usr/share/applications"
	install -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

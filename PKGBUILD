pkgname=ardupilot-mission-planner
pkgver=1.3.83
epoch=2
pkgrel=1
pkgdesc="Full-featured ground station application for the ArduPilot open source autopilot project"
arch=('x86_64')
url="https://github.com/ArduPilot/MissionPlanner"
license=("GPL3")
depends=('mono')

source=(
  "https://firmware.ardupilot.org/Tools/MissionPlanner/MissionPlanner-${pkgver}.zip"
  ${pkgname}.desktop
)

sha256sums=(
  'ff3694f7a9038caf756545049dd7aef74e3d0d8fe3586e87aa881045704dd6f9'
  'e2b0bde2cf9dd598103c2d6babeeae82c72901cdff19b8db1fe579d176a6139f'
)

package() {
	install -d "${pkgdir}/opt/${pkgname}"
	cp -r ${srcdir}/* ${pkgdir}/opt/${pkgname} -R

  # Mission Planner's .zip file ships without a Linux-compatible .desktop file,
  # so I've made one in this AUR repo to make Mission Planner easier to launch
	install -d "${pkgdir}/usr/share/applications"
	install -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

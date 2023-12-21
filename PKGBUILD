pkgname=ardupilot-mission-planner
pkgver=1.3.81
epoch=2
pkgrel=4  # Todo: reset to 1 when changing the version!
pkgdesc="Full-featured ground station application for the ArduPilot open source autopilot project"
arch=('x86_64')
url="https://github.com/ArduPilot/MissionPlanner"
license=("GPL3")
depends=('mono')

source=("https://firmware.ardupilot.org/Tools/MissionPlanner/MissionPlanner-${pkgver}.zip" ${pkgname}.desktop)

sha256sums=(
  '197fcbba1e8c3c3ccc0afc568d4565cd253424618f0ecdeb69b04a8309c86cbf'
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

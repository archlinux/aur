# Author: mosra <mosra@centrum.cz>
pkgname=ardupilot-mission-planner
_pkgname=mission-planner
pkgver=2022_03_28
pkgrel=1
pkgdesc="Mission Planner Ground Control Station"
arch=('x86_64')
url="https://github.com/ArduPilot/MissionPlanner"
license=("GPL3")
depends=('mono')

source=("https://firmware.ardupilot.org/Tools/MissionPlanner/MissionPlanner-1.3.77.zip" ${_pkgname}.desktop)

sha256sums=(
  '3837cdfae62610847a5db3b325aae26c740f630932236eb29cb62dbd4fcde23d'
  'c7acaec9695d2df58ad7b7f950275d9acd086f5bbe6316eb6d0b0f6ab65b00d2'
)

package() {
	install -d "${pkgdir}/opt/${_pkgname}"
	cp -r ${srcdir}/* ${pkgdir}/opt/${_pkgname} -R

	install -d "${pkgdir}/usr/share/applications"
	install -m644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}

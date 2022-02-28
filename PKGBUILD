# Author: mosra <mosra@centrum.cz>
pkgname=ardupilot-mission-planner
_pkgname=mission-planner
pkgver=2022_02_28
pkgrel=1
pkgdesc="Mission Planner Ground Control Station"
arch=('x86_64')
url="https://github.com/ArduPilot/MissionPlanner"
license=("GPL3")
depends=('mono')

source=("https://firmware.ardupilot.org/Tools/MissionPlanner/MissionPlanner-1.3.76.zip" ${_pkgname}.desktop)

sha256sums=(
  'bddba7506c0b8c329fd4b0e1b724d0004c5d75e73259cd537593b2baed2a3259'
  'c7acaec9695d2df58ad7b7f950275d9acd086f5bbe6316eb6d0b0f6ab65b00d2'
)

package() {
	install -d "${pkgdir}/opt/${_pkgname}"
	cp -r ${srcdir}/* ${pkgdir}/opt/${_pkgname} -R

	install -d "${pkgdir}/usr/share/applications"
	install -m644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}

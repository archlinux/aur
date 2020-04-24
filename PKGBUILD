# Author: mosra <mosra@centrum.cz>
pkgname=ardupilot-mission-planner
_pkgname=mission-planner
pkgver=2020_01_05
pkgrel=1
pkgdesc="Mission Planner Ground Control Station"
arch=('x86_64')
url="https://github.com/ArduPilot/MissionPlanner"
license=("GPL3")
depends=('mono')

source=("https://firmware.ardupilot.org/Tools/MissionPlanner/MissionPlanner-latest.zip" ${_pkgname}.desktop)
sha256sums=(
	'a2dfa193c6aad01927931b91eeac38c5dc06c4db59dc4e8d2c9c868edcf6dc73'
	'c7acaec9695d2df58ad7b7f950275d9acd086f5bbe6316eb6d0b0f6ab65b00d2'
)

package() {
	install -d "${pkgdir}/opt/${_pkgname}"
	cp -r ${srcdir}/* ${pkgdir}/opt/${_pkgname} -R

	install -d "${pkgdir}/usr/share/applications"
	install -m644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}

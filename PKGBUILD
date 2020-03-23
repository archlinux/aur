# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname=task-indicator
pkgdesc='Panel indicator for TaskWarrior'
pkgver=1.41
pkgrel=2
url=https://github.com/umonkey/task-indicator
license=(custom:MIT)
arch=(any)
depends=(python2 hicolor-icon-theme python2-gobject2 python2-dateutil)
optdepends=('libappindicator-gtk2: Application indicator support')
conflicts=(task-indicator-git taskwarrior-indicator-hg)
source=("${pkgname}::git+${url}#tag=version-${pkgver}")
source=("${url}/archive/version-${pkgver}.tar.gz")
sha512sums=('e5ffba6ff0e79f1510bc70bfa109b3e9540e3babfa8cc3ebb4b86c31323dac98f4d60c26174e15b863d21c938524c53c0f06f8508ca1d5dceaa5d93f10c00f59')

package () {
	cd "${pkgname}-version-${pkgver}"
	python2 setup.py install --root="${pkgdir}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

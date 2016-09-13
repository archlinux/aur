# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='taskwarrior-indicator-hg'
pkgdesc='Panel indicator for TaskWarrior'
pkgver=r162.afb0e22fcaf8
pkgrel=2
url='http://umonkey.net/projects/task-indicator/index.en.html'
license=('MIT')
arch=('any')
depends=(
	'python2'
	'hicolor-icon-theme'
	'python2-gobject2'
)
optdepends=(
	'libappindicator-gtk2: Application indicator support'
)
source=("${pkgname}::hg+https://bitbucket.org/umonkey/task-indicator")
sha512sums=('SKIP')

pkgver () {
	cd "${pkgname}"
	printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

package () {
	cd "${pkgname}"
	python2 setup.py install --root="${pkgdir}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

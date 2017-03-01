_reponame=ldoce5viewer-pyqt5
pkgname=$_reponame-git
pkgver=1.0
pkgrel=1
pkgdesc="LDOCE5 viewer ported to PyQt5 for retina (HiDPI) support. "
license=(GPL3)
conflicts=(ldoce5viewer-git ldoce5viewer)
arch=('i686' 'x86_64')
url='https://github.com/purboo/ldoce5viewer-pyqt5'
depends=(python-pyqt5 pyqt5-common python-lxml python-whoosh)
source=("git://github.com/purboo/ldoce5viewer-pyqt5.git")
md5sums=('SKIP')

build() {
	cd "${srcdir}/${_reponame}"
	make
}

package() {
	cd "${srcdir}/${_reponame}"

	python setup.py install --optimize=1 --root="${pkgdir}"
	install -Dm644 "ldoce5viewer/qtgui/resources/ldoce5viewer.svg" \
	"${pkgdir}/usr/share/pixmaps/ldoce5viewer.svg"
	install -Dm644 "ldoce5viewer.desktop" \
	"${pkgdir}/usr/share/applications/ldoce5viewer.desktop"
	install -Dm644 "LICENSE.txt" \
	"${pkgdir}/usr/share/licenses/$pkgname/LICENSE.txt"
	install -Dm644 "COPYING.txt" \
	"${pkgdir}/usr/share/licenses/$pkgname/COPYING.txt"
}


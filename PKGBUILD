# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=vista
pkgname=python-vista
pkgver=0.19.0
pkgrel=1
pkgdesc="A Streamlined Python Interface to the Visualization Toolkit"
arch=('any')
url="https://github.com/pyvista/vista"
license=('MIT')
depends=(
	'python-appdirs'
	'python-imageio'
	'python-matplotlib'
	'python-pyqt5'
	'vtk'
)
replaces=('python-vtkinterface')
makedepends=('python-setuptools')
source=("https://github.com/pyvista/vista/archive/${pkgver}.tar.gz")
sha256sums=('13df02f0f59f1088f41abf00802e639d5adb177539bd5bd724e38f57ec613aaa')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -D -m644 \
		"${srcdir}/$_pkgname-$pkgver/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root=$pkgdir
}

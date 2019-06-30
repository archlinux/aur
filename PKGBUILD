# Maintainer: Michael Borders <michael.a.borders@gmail.com>
# Contributor: Martino Pilia <martino.pilia@gmail.com>
_pkgname=pyvista
pkgname=python-pyvista
pkgver=0.21.0
pkgrel=1
pkgdesc="A Streamlined Python Interface to the Visualization Toolkit"
arch=('any')
url="https://github.com/pyvista/pyvista"
license=('MIT')
depends=('python-appdirs'
	'python-imageio'
	'python-matplotlib'
	'python-pyqt5'
	'vtk'
)
replaces=('python-vtkinterface'
	'python-vista'
)
makedepends=('python-setuptools')
source=("https://github.com/pyvista/pyvista/archive/${pkgver}.tar.gz")
sha256sums=('24e92419f228322545148190899bdb81d0d17501f3e6d6f6fa4a2b62de82b329')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -D -m644 \
		"${srcdir}/$_pkgname-$pkgver/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root=$pkgdir
}

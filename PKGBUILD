# Maintainer: Michael Borders <michael.a.borders@gmail.com>
# Contributor: Martino Pilia <martino.pilia@gmail.com>
_pkgname=pyvista
pkgname=python-pyvista
pkgver=0.20.1
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
sha256sums=('a340951292c41c1ae79a8b653f6253b4f402d55c359f5b1a3d26e7b8f93a3ea9')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -D -m644 \
		"${srcdir}/$_pkgname-$pkgver/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root=$pkgdir
}

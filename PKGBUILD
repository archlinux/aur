# Maintainer: PumpkinCheshire <sollyonzou at gmail dot com>

pkgname=python-meshplex
_name=meshplex
pkgver=0.16.0
pkgrel=1
pkgdesc="Compute interesting points, areas, and volumes in triangular and tetrahedral meshes."
arch=('any')
url="https://github.com/nschloe/meshplex"
license=('GPL')
optdepends=('python-matplotlib' 'python-vtk')
makedepends=('python'
	'python-setuptools')
depends=('python-meshio' 'python-numpy')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('b07ed79d7a7e7853790754fc067312725f326f43ce6d5153c7836b653cb53999')

build() {
	cd "$srcdir/$_name-$pkgver"
	python -c "from setuptools import setup; setup()" build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python -c "from setuptools import setup; setup();" install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

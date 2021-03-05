# Maintainer: PumpkinCheshire <sollyonzou at gmail dot com>

pkgname=python-optimesh
_name=optimesh
pkgver=0.8.0
pkgrel=1
pkgdesc="Mesh optimization, mesh smoothing."
arch=('any')
url="https://github.com/nschloe/optimesh"
license=('GPL')
optdepends=('python-matplotlib')
makedepends=('python'
	'python-setuptools')
depends=('python-meshio' 'python-meshplex' 'python-numpy' 'python-quadpy' 'python-termplotlib')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('2da797f5741de6004ac9312da675c4a34b8942884dd9712f498a614cad947856')

build() {
	cd "$srcdir/$_name-$pkgver"
	python -c "from setuptools import setup; setup()" build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python -c "from setuptools import setup; setup();" install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}

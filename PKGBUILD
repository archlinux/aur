# Maintainer: PumpkinCheshire <sollyonzou at gmail dot com>

pkgname=python-meshplex
_name=meshplex
pkgver=0.15.13
pkgrel=1
pkgdesc="A wrapper around protocol buffers."
arch=('any')
url="https://github.com/nschloe/meshplex"
license=('GPL')
optdepends=('python-matplotlib' 'python-vtk')
makedepends=('python'
	'python-setuptools')
depends=('python-meshio' 'python-numpy')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('b5ba5d7b142c743d955457a16fda84e504910fee2cff518939c3e89a842107f9')

build() {
	cd "$srcdir/$_name-$pkgver"
	python -c "from setuptools import setup; setup()" build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python -c "from setuptools import setup; setup();" install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

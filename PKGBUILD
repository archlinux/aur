# Maintainer:  Alexander Bocken <alexander@bocken.org>

_name=gigaanalysis
pkgname=python-${_name,,}
pkgver=0.4.5
pkgrel=1
pkgdesc="A toolbox for processing data that can be expressed as a dependent and independent variable."
arch=('any')
url="https://github.com/alexeatscake/gigaanalysis"
license=('BSD-3-Clause')
depends=('python>=3.7.7'
	 'python-numpy>=1.21.2'
	 'python-pandas>=1.3.4'
	 'python-matplotlib>=3.4.3'
	 'python-h5py>=2.10.0'
)
makedepends=('python-installer' 'python-wheel' 'python-build')

source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('bf105cc8bd546a6dc11673a4fcb631e5b3f3c48d6cb2e29244e15a106ca70df8')

makedepends=(python-build python-installer python-wheel)

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

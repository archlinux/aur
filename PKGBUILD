# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>

_pkgname=dipy
pkgname=python-dipy
pkgver=0.16.0
pkgrel=1
pkgdesc="Diffusion MR imaging in Python"
arch=('x86_64')
url="http://nipy.org/dipy/"
license=('BSD')
depends=('python-numpy' 'python-scipy' 'python-nibabel' 'python-h5py')
makedepends=('python-setuptools' 'cython')
source=("https://github.com/nipy/dipy/archive/${pkgver}.tar.gz")
sha256sums=('16f4527524e3dd08a8125f683f8f04bdb49c7ac9072acd2021f1ada1dee3e2ae')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root="$pkgdir"
}

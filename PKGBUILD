# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>

_pkgname=dipy
pkgname=python-dipy
pkgver=1.1.1
pkgrel=1
pkgdesc="Diffusion MR imaging in Python"
arch=('x86_64')
url="http://nipy.org/dipy/"
license=('BSD')
depends=('python-numpy' 'python-scipy' 'python-nibabel' 'python-h5py')
makedepends=('python-setuptools' 'cython')
source=("https://github.com/nipy/dipy/archive/${pkgver}.tar.gz")
sha256sums=('c6deaf95a249e570231dd0009b4297136b0f1b43c0a670f81eaba6e4ac26b696')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root="$pkgdir"
}

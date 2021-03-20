# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>

_pkgname=dipy
pkgname=python-dipy
pkgver=1.4.0
pkgrel=1
pkgdesc="Diffusion MR imaging in Python"
arch=('x86_64')
url="http://nipy.org/dipy/"
license=('BSD')
depends=('python-numpy' 'python-scipy' 'python-nibabel' 'python-h5py')
makedepends=('python-setuptools' 'cython')
source=("https://github.com/nipy/dipy/archive/${pkgver}.tar.gz")
sha256sums=('30d29820b032a47f304cfd666f325d887074ac392bb0ec4311cab29907ba1e31')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root="$pkgdir"
}

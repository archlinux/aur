# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=dipy
pkgname=python-$_pkgname
pkgver=0.15.0
pkgrel=1
pkgdesc="Diffusion MR imaging in Python"
arch=('x86_64')
url="http://nipy.org/dipy/"
license=('BSD')
depends=('python-numpy' 'python-scipy' 'python-nibabel' 'python-h5py')
makedepends=('python-setuptools' 'cython')
source=("https://github.com/nipy/dipy/archive/${pkgver}.tar.gz")
sha256sums=('9446486a45059d390ef2fc9dc42b3877f61db2de5e037e795ffbb0b6872af8fb')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root="$pkgdir"
}

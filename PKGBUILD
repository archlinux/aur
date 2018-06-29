# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=dipy
pkgname=python-$_pkgname
pkgver=0.14.0
pkgrel=1
pkgdesc="Diffusion MR imaging in Python"
arch=('x86_64')
url="http://nipy.org/dipy/"
license=('BSD')
depends=('python-numpy' 'python-scipy' 'python-nibabel' 'python-h5py')
makedepends=('python-setuptools' 'cython')
source=("https://github.com/nipy/dipy/archive/${pkgver}.tar.gz")
sha512sums=('312c5ec997ceac3d43c4c0ad87e030dd6a7b9310ae31ae2ef2a0efc0286e576f862552800fc9d3a81fcc4ff5295c0dc90e2ac9c6b22924120b841378152d6882')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --optimize=1 --root="$pkgdir"
}

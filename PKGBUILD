# Maintainer: Adrien Wu <adrien.sf.wu@gmail.com>
pkgname=python-opt-einsum
pkgver=3.1.0
pkgrel=1
pkgdesc="Optimizing einsum functions in NumPy, Tensorflow, Dask, and more with contraction order optimization"
url="https://github.com/dgasmith/opt_einsum"
arch=('any')
provides=('python-opt-einsum')
depends=('python')
makedepends=('python-setuptools')
_name=opt_einsum
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('edfada4b1d0b3b782ace8bc14e80618ff629abf53143e1e6bbf9bd00b11ece77')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

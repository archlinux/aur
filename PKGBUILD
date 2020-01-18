# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: xantares

_name=george
pkgname=python-george
pkgver=0.3.1
pkgrel=1
pkgdesc="Fast Gaussian Processes for regression"
url="https://github.com/dfm/george"
arch=(any)
license=('MIT')
depends=('python-scipy' 'python-numpy' 'pybind11')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
md5sums=('0ce0f2a225eb3a0ed4517a10b93a1dd6')


build() {
  cd "$_name-$pkgver"
  python setup.py build
} 

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}


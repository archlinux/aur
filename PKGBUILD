# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Michael Spradling <mike@mspradling.com>

_name=EasyProcess
pkgname=python-easyprocess
pkgver=0.2.9
pkgrel=1
pkgdesc="easy to use python subprocess interface"
arch=(any)
url="https://github.com/ponty/EasyProcess"
license=('BSD')
depends=('python' 'python-setuptools')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
md5sums=('a1008fc7b2cb69ff2f48a5fae201c24d')


build() {
  cd "${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

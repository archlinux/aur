# Maintainer: Dian M Fay <dian.m.fay@gmail.com>
_name=aiosql
pkgname=python-aiosql
pkgver=3.0.0
pkgrel=1
pkgdesc="Simple SQL in Python"
arch=("any")
url="https://pypi.python.org/pypi/$_name"
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
conflicts=("${pkgname}" "${pkgname}-git")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('9256d6825ed958cfe70c4af483a05c220fbbdbfbdd237122325dd853ccc1569b')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 || return 1
}

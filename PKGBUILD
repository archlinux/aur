# Maintainer: Dian M Fay <dian.m.fay@gmail.com>
_name=aiosql
pkgname=python-aiosql
pkgver=3.2.0
pkgrel=1
pkgdesc="Simple SQL in Python"
arch=("any")
url="https://pypi.python.org/pypi/$_name"
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
conflicts=("${pkgname}" "${pkgname}-git")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('f6e4fded66753dd82b020a9ea936ce8acb63e73640b4ac9026c6ad6874940a91')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 || return 1
}

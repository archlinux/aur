# Maintainer: John Gerritse <tyrannis dot hawk at gmail dot com>
pkgname=python-captionstransformer
_name=${pkgname#python-}
pkgver=1.2.1
pkgrel=1
pkgdesc='A set of tools (API + script) to read, write and transform captions from/to many formats'
arch=(any)
url=https://pypi.org/project/captionstransformer
license=(GPL)
depends=(python)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.zip")
sha256sums=('6f5e0eb7ba49f0286dd183cbc082c5f2bffe790996ef3e749dbac5d28f8d86d8')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}

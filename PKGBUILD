# Maintainer: John Gerritse <tyrannis dot hawk at gmail dot com>
pkgname=python-pysubs2
_name=${pkgname#python-}
pkgver=1.4.1
pkgrel=0
pkgdesc='A Python library for editing subtitle files'
arch=(any)
url=https://pypi.org/project/pysubs2
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('2d07157d4e838c7e041ed35b4a69bf5a5570eb47f8bd36bb7a9706736b72ebff')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}

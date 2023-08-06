# Maintainer: Pierre-Alain TORET <pierre-alain.toret@protonmail.com>
pkgname=('python-drf-nested-routers')
_name=${pkgname#python-}
pkgver=0.93.4
pkgrel=1
pkgdesc="Nested resources for the Django Rest Framework"
arch=(any)
url="https://pypi.org/project/drf-nested-routers/"
license=('Apache')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('01aa556b8c08608bb74fb34f6ca065a5183f2cda4dc0478192cc17a2581d71b0')
makedepends=('python-setuptools')

build() {
  cd ${srcdir}/$_name-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/$_name-${pkgver}
  python setup.py install --prefix=/usr --root=${pkgdir}
}

# Maintainer: getzze <getzze at gmail dot com>

_module=django-dynamic-preferences
pkgname=python-${_module}
pkgver=1.16.0
pkgrel=1
pkgdesc="Dynamic global and instance settings for your django project"
arch=(any)
url="https://github.com/agateblue/django-dynamic-preferences"
license=(BSD)
depends=(python-django python-six python-persisting-theory)
makedepends=(python-setuptools)
source=(https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module}-$pkgver.tar.gz)
sha256sums=('0d3d456626244d0bdaf312c81f2b3e14bd16134e8fcf53a33fd12e5d0bdd88dd')


build() {
  cd "${_module}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_module}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}

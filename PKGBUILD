# Maintainer: getzze <getzze at gmail dot com>

_module=django-dynamic-preferences
pkgname=python-${_module}
pkgver=1.17.0
pkgrel=1
pkgdesc="Dynamic global and instance settings for your django project"
arch=(any)
url="https://github.com/agateblue/django-dynamic-preferences"
license=(BSD)
depends=(python-django python-six python-persisting-theory)
makedepends=(python-setuptools)
source=(${_module}-${pkgver}.tar.gz::https://github.com/agateblue/django-dynamic-preferences/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('00a66a054cedc2f656b99b6e49f322a232167fef7219f5f01e7940c3ec862e15')


build() {
  cd "${_module}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_module}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}

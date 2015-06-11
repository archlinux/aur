# Maintainer: Erhan SAHIN < erhan@ssahin.net >

pkgname="python2-django-pyscss"
pkgver=1.0.6
pkgrel=1
pkgdesc="Makes it easier to use PySCSS in Django"
arch=("any")
url="https://pypi.python.org/pypi/django-pyscss"
license=("custom")
makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/d/django-pyscss/django-pyscss-${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/django-pyscss-${pkgver}/"
  python2 setup.py build
}

package() {
  cd "${srcdir}/django-pyscss-${pkgver}/"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m 644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

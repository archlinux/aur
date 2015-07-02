# Maintainer: Erhan SAHIN < erhan@ssahin.net >

pkgname="python2-django-pyscss-liberty"
pkgver=2.0.2
pkgrel=1
pkgdesc="Makes it easier to use PySCSS in Django"
arch=("any")
url="https://pypi.python.org/pypi/django-pyscss"
license=("custom")
makedepends=("python2-setuptools")
depends=("python2-pyscss-liberty")
source=("https://pypi.python.org/packages/source/d/django-pyscss/django-pyscss-${pkgver}.tar.gz")
sha256sums=('0f4844f8fd3f69f4d428a616fdcf2b650a24862dd81443ae3fba14980c7b0615')

build() {
  cd "${srcdir}/django-pyscss-${pkgver}/"
  python2 setup.py build
}

package() {
  cd "${srcdir}/django-pyscss-${pkgver}/"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m 644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

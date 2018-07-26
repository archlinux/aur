#
# Maintainer: oi_wtf <brainpower at mailbox dot org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=python2-django-picklefield
pkgver=1.0.0
pkgrel=1
pkgdesc='A pickled object field for Django'
arch=('any')
url='https://github.com/gintas/django-picklefield'
license=('MIT')
depends=('python2-django')
makedepends=('python2-setuptools')
source=("django-picklefield-${pkgver}.tar.gz::https://github.com/gintas/django-picklefield/archive/v${pkgver}.tar.gz")
sha256sums=('e5735c69ed5013ccf22b9189e562a250b8f1ed7eaf974e7235cce1ddd595bf35')

build() {
  cd django-picklefield-${pkgver}
  python2 setup.py build
}

package_python2-django-picklefield() {
  cd django-picklefield-${pkgver}

  python2 setup.py install --skip-build --root="${pkgdir}" --optimize='1' --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/python2-django-picklefield
}

# vim: ts=2 sw=2 et:


#
# Maintainer: oi_wtf <brainpower at mailbox dot org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=python2-django-picklefield
pkgver=2.0.0
pkgrel=1
pkgdesc='A pickled object field for Django'
arch=('any')
url='https://github.com/gintas/django-picklefield'
license=('MIT')
depends=('python2-django')
makedepends=('python2-setuptools' 'git')
source=("git+https://github.com/gintas/django-picklefield.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd django-picklefield
  python2 setup.py build
}

package_python2-django-picklefield() {
  cd django-picklefield

  python2 setup.py install --skip-build --root="${pkgdir}" --optimize='1' --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/python2-django-picklefield
}

# vim: ts=2 sw=2 et:


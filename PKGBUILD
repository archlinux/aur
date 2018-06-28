# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=python-django-q
pkgver=0.9.4
pkgrel=2
pkgdesc='A multiprocessing distributed task queue for Django'
arch=('any')
url='https://github.com/Koed00/django-q'
license=('MIT')
depends=(
  'python-arrow' 'python-blessed' 'python-django' 'python-django-picklefield'
  'python-future' 'python-six'
)
makedepends=('python-setuptools')
source=("django-q-${pkgver}.tar.gz::https://github.com/Koed00/django-q/archive/v${pkgver}.tar.gz")
sha256sums=('f920453fdab30da4da8bb27bfdd97d9aa3a7088925fa5d6324a001b377e4910a')

build() {
  cd django-q-${pkgver}

  python setup.py build
}

package() {
  cd django-q-${pkgver}

  python setup.py install --root="${pkgdir}" --optimize='1' --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/python-django-q/
}

# vim: ts=2 sw=2 et:


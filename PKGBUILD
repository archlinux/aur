# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=python-django-q
pkgver=1.3.4
pkgrel=3
pkgdesc='A multiprocessing distributed task queue for Django'
arch=(any)
url=https://github.com/Koed00/django-q
license=(MIT)
depends=(
  python-arrow
  python-blessed
  python-django
  python-django-picklefield
  python-future
  python-six
)
makedepends=(
  git
  python-setuptools
)
_tag=552af9db8c8aa42831eca9804e366729180d0eff
source=(git+https://github.com/Koed00/django-q.git#tag=${_tag})
sha256sums=(SKIP)

pkgver() {
  cd django-q

  git describe --tags | sed 's/^v//'
}

build() {
  cd django-q

  python setup.py build
}

package() {
  cd django-q

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/python-django-q/
}

# vim: ts=2 sw=2 et:

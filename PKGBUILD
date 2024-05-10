# Maintainer: atomicfs <https://aur.archlinux.org/account/atomicfs>

pkgname=python-django-auditlog
pkgver=3.0.0
pkgrel=5
pkgdesc="A Django app that keeps a log of changes made to an object"
arch=('any')
url="https://github.com/jazzband/django-auditlog"
license=('MIT')
depends=(
  'python'
  'python-django'
  'python-psycopg'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel'
)
source=("${pkgname}::git+${url}#tag=v${pkgver}")
sha256sums=('SKIP')

#check() {
#  cd "${srcdir}/${pkgname}"
#  python runtests.py
#}
# TO run this test one needs a running PostgreSQL database

build() {
  cd "${srcdir}/${pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}

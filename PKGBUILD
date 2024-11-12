# shellcheck disable=SC2034,2154,2148
# Maintainer: atomicfs <https://aur.archlinux.org/account/atomicfs>

pkgname=python-django-multiselectfield
pkgver=0.1.12
pkgrel=4
pkgdesc="A Multiple Choice model field"
arch=('any')
url="https://github.com/goinnn/django-multiselectfield"
license=('LGPL-3.0-only')
depends=(
  'python'
  'python-django'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("${pkgname}::git+${url}#tag=v${pkgver}")
sha256sums=('SKIP')

#check() {}
# They use tox for testing :(

build() {
  cd "${srcdir}/${pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}

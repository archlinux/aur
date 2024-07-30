# Maintainer: atomicfs <https://aur.archlinux.org/account/atomicfs>

pkgname=python-django-rest-framework-guardian
_pkgname=django-rest-framework-guardian
pkgver=0.5.0
pkgrel=4
pkgdesc="django-guardian support for Django REST Framework"
arch=('any')
url="https://github.com/johnthagen/django-rest-framework-guardian2"
license=('BSD-3-Clause')
depends=(
  'python'
  'python-django'
  'python-django-rest-framework'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

source=("${pkgname}::git+https://github.com/johnthagen/${_pkgname}2#tag=v${pkgver}")
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

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

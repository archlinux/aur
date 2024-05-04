# shellcheck disable=SC2034,2154,2148
# Maintainer: amo <https://aur.archlinux.org/account/amo>

_name=django-auditlog
pkgname=python-django-auditlog
pkgver=3.0.0
pkgrel=3
pkgdesc="A Django app that keeps a log of changes made to an object."
arch=('any')
url="https://github.com/jazzband/django-auditlog"
license=('MIT')
makedepends=('python-setuptools' 'python-pip')
source=("$pkgname-$pkgver.src.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('9de49f80a4911135d136017123cd73461f869b4947eec14d5e76db4b88182f3f')

build() {
  cd "$_name-$pkgver" || exit
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver" || exit
  python -m installer --destdir="$pkgdir" dist/*.whl
}

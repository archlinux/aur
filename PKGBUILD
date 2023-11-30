# shellcheck disable=SC2034,2154,2148
# Maintainer: amo <https://aur.archlinux.org/account/amo>

_name=django-auditlog
pkgname=python-django-auditlog
pkgver=2.3.0
pkgrel=1
pkgdesc="A Django app that keeps a log of changes made to an object."
arch=('any')
url="https://github.com/jazzband/django-auditlog"
license=('MIT')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.src.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('b9d3acebb64f3f2785157efe3f2f802e0929aafc579d85bbfb9827db4adab532')

build() {
  cd "$_name-$pkgver" || exit
  python setup.py build
}

package() {
  cd "$_name-$pkgver" || exit

  export PYTHONHASHSEED=0
  python setup.py install --skip-build \
      --optimize=1 \
      --prefix=/usr \
      --skip-build \
      --root="$pkgdir"
}

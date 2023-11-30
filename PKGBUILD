# shellcheck disable=SC2034,2154,2148
# Maintainer: amo <https://aur.archlinux.org/account/amo>

_name=django-multiselectfield
pkgname=python-django-multiselectfield
pkgver=0.1.12
pkgrel=1
pkgdesc="A Multiple Choice model field"
arch=('any')
url="https://github.com/goinnn/django-multiselectfield"
license=('LGPL-3')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.src.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('d0a4c71568fb2332c71478ffac9f8708e01314a35cf923dfd7a191343452f9f9')

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

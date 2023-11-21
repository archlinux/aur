# Contributor: Lucki <https://aur.archlinux.org/account/Lucki>
# Contributor: amo <https://aur.archlinux.org/account/amo>

_pkgname=django-polymorphic-tree
pkgname=python-django-polymorphic-tree
pkgver=2.1
pkgrel=1
pkgdesc="Polymorphic MPTT tree support for models"
arch=('any')
url="https://github.com/django-polymorphic/django-polymorphic-tree"
license=('Apache')
depends=('python-django' 'python-django-mptt' 'python-django-polymorphic' 'python-django-tag-parser' 'python-future')
makedepends=('python-setuptools' 'python-django-js-asset')
source=("$pkgname-$pkgver.tar.gz::https://github.com/django-polymorphic/django-polymorphic-tree/archive/v$pkgver.tar.gz")
sha512sums=('6fb01c34e262cd8652c71b1e64602300a79b3d13337d34a309243a7d8e2db0aacc01b9c7604222f44d5292d350f819f14efb7c4b9140b7a98dad2ec09ef4dbfe')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$_pkgname-$pkgver"
  python runtests.py
}

package() {
  cd "$_pkgname-$pkgver"

  export PYTHONHASHSEED=0
  python setup.py install --skip-build \
      --optimize=1 \
      --prefix=/usr \
      --root="$pkgdir"
}

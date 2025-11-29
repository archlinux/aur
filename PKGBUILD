# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=python-abx-spec-django
pkgver=0.1.0
pkgrel=1
pkgdesc="Add your description here."
arch=('any')
url="https://pypi.org/project/abx-spec-django"
license=('MIT')
depends=('python' 'python-abx')
makedepends=('python-build' 'python-installer' 'python-hatchling')

source=("https://pypi.python.org/packages/source/a/abx-spec-django/abx_spec_django-${pkgver}.tar.gz")
md5sums=('474ca2a37d9cf6a334946deb05677d0a')

build() {
  cd "$srcdir/abx_spec_django-$pkgver"
  python -m build --no-isolation --wheel
}
package() {
  cd "$srcdir/abx_spec_django-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:

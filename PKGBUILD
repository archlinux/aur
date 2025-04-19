# Contributor: Anthony25 <Anthony Ruhier>
#
# Thanks to Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com> for
# his PKGBUILD that served as a base for this one

pkgbase=python-django-mptt
_name="${pkgbase#python-}"
pkgname=python-django-mptt
pkgver=0.17
pkgrel=1
pkgdesc="Utilities for implementing a modified pre-order traversal tree in django."
arch=(any)
url='https://github.com/django-mptt/django-mptt'
license=(BSD)
makedepends=(python-build python-installer python-wheel python-hatchling)
depends=('python-django>=3.2' 'python-django-js-asset')
options=(!emptydirs)
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/django-mptt/${_name}/archive/${pkgver}.tar.gz")
sha256sums=('699cac8061146b69a0f4017246967b525c9765ab369c23b1dc0a419d1aa60124')


build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

# Contributor: Anthony25 <Anthony Ruhier>
#
# Thanks to Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com> for
# his PKGBUILD that served as a base for this one

pkgbase=python-django-mptt
_name="${pkgbase#python-}"
pkgname=python-django-mptt
pkgver=0.15
pkgrel=2
pkgdesc="Utilities for implementing a modified pre-order traversal tree in django."
arch=(any)
url='https://github.com/django-mptt/django-mptt'
license=(BSD)
makedepends=(python-build python-installer python-wheel python-hatchling)
depends=('python-django>=3.2' 'python-django-js-asset')
options=(!emptydirs)
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/django-mptt/${_name}/archive/${pkgver}.tar.gz")
sha256sums=('06660244d55076c5c2d42ee70db9e763fb7d944c04b473a3d8bfb647b89fd3cf')


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

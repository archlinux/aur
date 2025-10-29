# Contributor: Anthony25 <Anthony Ruhier>
#
# Thanks to Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com> for
# his PKGBUILD that served as a base for this one

pkgbase=python-django-mptt
_name="${pkgbase#python-}"
pkgname=python-django-mptt
pkgver=0.18
pkgrel=1
pkgdesc="Utilities for implementing a modified pre-order traversal tree in django."
arch=(any)
url='https://github.com/django-mptt/django-mptt'
license=(BSD)
makedepends=(python-build python-installer python-wheel python-hatchling)
depends=('python-django>=3.2' 'python-django-js-asset')
options=(!emptydirs)
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/django-mptt/${_name}/archive/${pkgver}.tar.gz")
sha256sums=('a8f6793989d8f0600c1de8ab5b007d9cc84bcbd6756265a6184532e8c8045de6')


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

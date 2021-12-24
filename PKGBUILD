# Maintainer: Anthony25 <Anthony Ruhier>
#
# Thanks to Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com> for
# his PKGBUILD that served as a base for this one

pkgbase=python-django-mptt
_pkgbase="${pkgbase#python-}"
pkgname=python-django-mptt
pkgver=0.13.4
pkgrel=1
pkgdesc="Utilities for implementing a modified pre-order traversal tree in django."
arch=(any)
url='https://github.com/django-mptt/django-mptt'
license=(BSD)
makedepends=(
  'python-django>=3.0'
  python-setuptools
  python-django-js-asset-git
)
depends=('python-django>=3.0' 'python-django-js-asset-git')
options=(!emptydirs)
source=("https://github.com/django-mptt/${_pkgbase}/archive/${pkgver}.tar.gz")
sha256sums=('7d5f586b6d6783af541136573b99996c72fcc49c34d4377250118dfe37f185a5')

package_python-django-mptt() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

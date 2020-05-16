# Maintainer: Anthony25 <Anthony Ruhier>
#
# Thanks to Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com> for
# his PKGBUILD that served as a base for this one

pkgbase=python-django-debug-toolbar
_pkgbase="${pkgbase#python-}"
pkgname=python-django-debug-toolbar
pkgver=2.2
pkgrel=1
pkgdesc='A configurable set of panels that display various debug information about the current request/response.'
arch=(any)
url='https://github.com/jazzband/django-debug-toolbar'
license=(BSD-3)
makedepends=(
  'python-django>=2.0'
  python-setuptools
)
depends=('python-django>=2.0' 'python-sqlparse')
conflicts=('python-django-debug-toolbar-git')
options=(!emptydirs)
source=("https://github.com/jazzband/${_pkgbase}/archive/${pkgver}.tar.gz")
sha256sums=('2f352bdeae58b447c24a6713abff570a37efae4e8a63c937baa99f69b8d96240')

package_python-django-debug-toolbar() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

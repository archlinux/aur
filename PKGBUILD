# Maintainer: Anthony25 <Anthony Ruhier>
#
# Thanks to Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com> for
# his PKGBUILD that served as a base for this one

pkgbase=python-django-debug-toolbar
_pkgbase="${pkgbase#python-}"
pkgname=(python-django-debug-toolbar python2-django-debug-toolbar)
pkgver=1.9
pkgrel=2
pkgdesc='A configurable set of panels that display various debug information about the current request/response.'
arch=(any)
url='https://github.com/jazzband/django-debug-toolbar'
license=(BSD-3)
makedepends=(
  'python-django>=1.8'
  python-setuptools
  'python2-django>=1.8'
  python2-setuptools
)
options=(!emptydirs)
source=("https://github.com/jazzband/${_pkgbase}/archive/${pkgver}.tar.gz")
sha256sums=('bb171fa5d6bb4e26136d0c43056d358a845a9bf814838c7ab58eaa7c76c85dcf')

package_python-django-debug-toolbar() {
  depends=('python-django>=1.8' 'python-sqlparse')
  conflicts=('python-django-debug-toolbar-git')
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-django-debug-toolbar() {
  depends=('python2-django>=1.8' 'python2-sqlparse')
  conflicts=('python2-django-debug-toolbar-git')
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

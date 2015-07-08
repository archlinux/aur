# Maintainer: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
#
# namcap warns that python-django and python-six are unnecessary dependencies.
# This is untrue.

pkgname=python-django-extensions
_pkgname=django-extensions
pkgver=1.5.5
pkgrel=1
pkgdesc='A collection of custom extensions for the Django Framework.'
arch=(any)
url='http://github.com/django-extensions/django-extensions'
license=(MIT)
depends=(python-django python-six)
makedepends=(python-setuptools)
optdepends=(
    'graphviz: to graph Django models'
    'python-werkzeug: to use the Werkzeug debugger in the embedded web server'
)
options=(!emptydirs)
source=("https://github.com/${_pkgname}/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('4ee4fe0559137a74df3d7692406d1efaa7c47fe903442f211b926104f193e436')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

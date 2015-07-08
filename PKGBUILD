# Maintainer: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
# Contributor: Dominik Kozaczko <dominik@kozaczko.info>
# Contributor: Alper Kanat <alperkanat@raptiye.org>
# Contributor: Apkawa <apkawa@gmail.com>
# Contributor: Schnouki <thomas.jost@gmail.com>
#
# namcap warns that python2-django and python2-six are unnecessary dependencies.
# This is untrue.
#
# This package was formerly named `django-extensions`. As a result, this package
# must provide and conflict with that package.

pkgname=python2-django-extensions
_pkgname=django-extensions
pkgver=1.5.5
pkgrel=1
pkgdesc='A collection of custom extensions for the Django Framework.'
arch=(any)
url='http://github.com/django-extensions/django-extensions'
license=(MIT)
depends=(python2-django python2-six)
makedepends=(python2-setuptools)
optdepends=(
    'graphviz: to graph Django models'
    'python2-werkzeug: to use the Werkzeug debugger in the embedded web server'
)
provides=(django-extensions)
conflicts=(django-extensions)
options=(!emptydirs)
source=("https://github.com/${_pkgname}/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('4ee4fe0559137a74df3d7692406d1efaa7c47fe903442f211b926104f193e436')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

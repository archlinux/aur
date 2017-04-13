# Maintainer: Anthony25 <Anthony Ruhier>
#
# Thanks to Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com> for
# his PKGBUILD that served as a base for this one

pkgbase=python-openapi-codec
_pkgbase="${pkgbase#python-}"
pkgname=(python-openapi-codec python2-openapi-codec)
pkgver=1.3.1
pkgrel=1
pkgdesc='An OpenAPI codec for Core API.'
arch=(any)
url='https://github.com/core-api/python-openapi-codec/'
license=(BSD)
makedepends=(
  python-setuptools
  python2-setuptools
)
options=(!emptydirs)
source=("https://github.com/core-api/${pkgbase}/archive/${pkgver}.tar.gz")
sha256sums=('38ff5fb6e6196e509fc052959020a730931fb5c8eac7e2a0d72d4dddbd4213bb')

package_python-openapi-codec() {
  depends=('python-coreapi')
  cd "${srcdir}/python-${_pkgbase}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-openapi-codec() {
  depends=('python2-coreapi')
  cd "${srcdir}/python-${_pkgbase}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

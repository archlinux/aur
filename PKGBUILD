# Maintainer: getzze
#

pkgname='python-django-oauth-toolkit'
_pkgbase="django-oauth-toolkit"
pkgver=1.3.3
pkgrel=1
pkgdesc='OAuth2 Provider for Django'
arch=(any)
url='https://github.com/jazzband/django-oauth-toolkit'
license=(BSD)
makedepends=( python-setuptools )
depends=(
  'python-django>=2.1'
  python-requests
  python-oauthlib
)
options=(!emptydirs)
source=("https://github.com/jazzband/${_pkgbase}/archive/${pkgver}.zip")
sha256sums=('89fe1067ee79096037fef29eae5fab4aa083c0c38c53a530448eb9ad4156a289')


package() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

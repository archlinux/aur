# Maintainer: getzze
#

pkgname='python-django-oauth-toolkit'
_pkgbase="django-oauth-toolkit"
pkgver=1.2.0
pkgrel=1
pkgdesc='OAuth2 Provider for Django'
arch=(any)
url='https://github.com/jazzband/django-oauth-toolkit'
license=(BSD)
makedepends=( python-setuptools )
depends=(
  'python-django>=2.0'
  python-requests
  python-oauthlib
)
options=(!emptydirs)
source=("https://github.com/jazzband/${_pkgbase}/archive/${pkgver}.zip")
sha256sums=('3750d7424a31ffb8e56e068864d1cdf03828c10e00c6691994800121d6c47f54')


package() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

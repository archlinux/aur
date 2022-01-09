# Maintainer: getzze
#

pkgname='python-django-oauth-toolkit'
_pkgbase="django-oauth-toolkit"
pkgver=1.5.0
pkgrel=1
pkgdesc='OAuth2 Provider for Django'
arch=(any)
url='https://github.com/jazzband/django-oauth-toolkit'
license=(BSD)
makedepends=( python-setuptools )
depends=(
  python-django
  python-requests
  python-oauthlib
  python-jwcrypto
)
options=(!emptydirs)
source=("https://github.com/jazzband/${_pkgbase}/archive/${pkgver}.zip")
sha256sums=('82347e1486a1d665638bc3c662e6810b6239152d9c4a3aafa31b16a3305fcde4')


package() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

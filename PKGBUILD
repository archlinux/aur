# Maintainer: getzze
#

pkgname='python-django-oauth-toolkit'
_pkgbase="django-oauth-toolkit"
pkgver=2.3.0
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
sha256sums=('cd1771548a55da0916752aff21ec087969339bf31b8c38403223819b7ddc25ca')


package() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

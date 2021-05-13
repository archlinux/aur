# Maintainer: Oscar Garcia Amor <ogarcia@connectical.com>

_pkgname=py-trello
pkgname=python-py-trello
pkgver=0.18.0
pkgrel=1
pkgdesc='Python API wrapper around Trello API'
arch=('any')
url='https://github.com/sarumont/py-trello'
license=('BSD')
depends=('python-dateutil' 'python-requests' 'python-requests-oauthlib' 'python-pytz')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sarumont/py-trello/archive/${pkgver}.tar.gz")
sha256sums=('c50fbf48f9486ed4f959738b35f3d0aec872c2a63a6ad3036b582052dc475691')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize='1'
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  cp LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}

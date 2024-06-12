# Maintainer: Oscar Garcia Amor <ogarcia@connectical.com>

_pkgname=py-trello
pkgname=python-py-trello
pkgver=0.20.1
pkgrel=1
pkgdesc='Python API wrapper around Trello API'
arch=('any')
url='https://github.com/sarumont/py-trello'
license=('BSD-3-Clause')
depends=('python-dateutil' 'python-requests' 'python-requests-oauthlib' 'python-pytz')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sarumont/py-trello/archive/v${pkgver}.tar.gz")
b2sums=('afcc3cfffbf90557b543eb79537770888ba6d53863ec84aa6ab999619ff38a5122b9fe61344787370a34a9091be5fa9d0619841d1e008e1e4b8ef098c3ffb54a')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize='1'
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  cp LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}

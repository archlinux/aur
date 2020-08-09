# Maintainer: Oscar Garcia Amor <ogarcia@connectical.com>

_pkgname=py-trello
pkgbase=python-py-trello
pkgname=('python-py-trello' 'python2-py-trello')
pkgver=0.17.1
pkgrel=1
pkgdesc='Python API wrapper around Trello API'
arch=('any')
url='https://github.com/sarumont/py-trello'
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/sarumont/py-trello/archive/${pkgver}.tar.gz")
sha256sums=('51a32be052122327e586d358c93801d53592c900e4fc8f3eb654b563cba6dbd1')

package_python-py-trello() {
  depends=('python-dateutil' 'python-requests' 'python-requests-oauthlib' 'python-pytz')

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize='1'
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  cp LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}

package_python2-py-trello() {
  depends=('python2-dateutil' 'python2-requests' 'python2-requests-oauthlib' 'python2-pytz')

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize='1'
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  cp LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}

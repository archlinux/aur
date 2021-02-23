# Maintainer: Alberto Redondo <albertomost at gmail dot com>

_pkgname=domain-connect-dyndns
_pkgname_gh=DomainConnectDDNS-Python
pkgname=python-${_pkgname}
pkgver=0.0.8
pkgrel=1
pkgdesc='Python client library for Dynamic DNS using Domain Connect'
arch=('any')
url='https://github.com/Domain-Connect/DomainConnectDDNS-Python'
_url_pypi='https://pypi.org/project/domain-connect-dyndns'
license=('MIT')
depends=(
  'python'
  'python-validators'
  'python-requests'
  'python-dnspython'
  'python-domain-connect'
)
makedepends=('python-setuptools')
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
md5sums=('9ec626ce5189e4072d723f2e25a40ed1')

build() {

  cd ${_pkgname_gh}-${pkgver}

  python setup.py build

}

package() {

  cd ${_pkgname_gh}-${pkgver}

  python setup.py install \
    -O1 \
    --root="${pkgdir}" \
    --skip-build

  install -Dm644 LICENSE \
    -t "${pkgdir}/usr/share/licenses/${pkgname}"

}

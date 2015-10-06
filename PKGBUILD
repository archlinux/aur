#  Maintainer: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python2-acme
_pkgname=acme
pkgver=0.0.0.dev20151006
pkgrel=1
pkgdesc="Parses and generates RFC 3339-compliant timestamps using Python datetime.datetime objects."
arch=('any')
license=('apache')
url="https://pypi.python.org/pypi/${_pkgname}"
depends=('python2' 'python2-pytz' 'python2-setuptools' 'python2-six' 'python2-werkzeug'
         'python2-requests' 'python2-pyRFC3339' 'python2-cryptography' 'python2-pyopenssl'
         'python2-mock' 'python2-pyasn1' 'python2-ndg-httpsclient')
source=("${_pkgname}-${pkgver}.tar.gz"::"https://pypi.python.org/packages/source/a/${_pkgname}/${_pkgname}-${pkgver}.tar.gz#md5=c08d9d60051e9ec12e23145d1162ba0a")
md5sums=('c08d9d60051e9ec12e23145d1162ba0a')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}"
}

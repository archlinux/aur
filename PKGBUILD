#  Maintainer: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python2-acme
_pkgname=acme
pkgver=0.0.0.dev20151008
pkgrel=1
pkgdesc="ACME protocol implementation for Python"
arch=('any')
license=('Apache')
url="https://pypi.python.org/pypi/${_pkgname}"
depends=('python2' 'python2-pytz' 'python2-setuptools' 'python2-six' 'python2-werkzeug'
         'python2-requests' 'python2-pyRFC3339' 'python2-cryptography' 'python2-pyopenssl'
         'python2-mock' 'python2-pyasn1' 'python2-ndg-httpsclient')
source=("https://pypi.python.org/packages/source/a/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('7c29e39761614fed4d16ee73faff8ee9')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python2 setup.py build
}

#check() {
#    cd "${srcdir}/${_pkgname}-${pkgver}"
#    python2 setup.py test
#}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}"
}

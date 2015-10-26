#  Maintainer: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python2-pyrfc3339
_pkgname=pyRFC3339
pkgver=0.2
pkgrel=1
pkgdesc="Parses and generates RFC 3339-compliant timestamps using Python datetime.datetime objects."
arch=('any')
license=('custom:MIT')
url="https://pypi.python.org/pypi/${_pkgname}"
depends=('python2' 'python2-pytz')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('5e0f7e40e363812180fffaae52daf2e6')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    python2 setup.py install --root="${pkgdir}"

    # Refering to the online license
    mkdir -p "${pkgdir}"/usr/share/licenses/${pkgname}
    echo "Please refer to https://github.com/kurtraschke/pyRFC3339/blob/master/LICENSE.txt for detailed license information." > "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

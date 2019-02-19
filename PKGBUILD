# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
# based on the python2-wadllib PKGBUILD by ValHue <vhuelamo at gmail dot com>

_pkgname="wadllib"
pkgname=("python-wadllib")
pkgver="1.3.2"
pkgrel="1"
pkgdesc="Python 3 library for navigating WADL files. The Web Application Description Language is an XML vocabulary for describing the capabilities of HTTP resources."
arch=('any')
url="https://launchpad.net/wadllib"
license=('LGPL3')
makedepends=('python-setuptools')
depends=('python-lazr-uri' 'python-setuptools' 'python-simplejson')
source=("${pkgname}-${pkgver}.tar.gz::https://launchpad.net/$_pkgname/trunk/$pkgver/+download/$_pkgname-$pkgver.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.asc::https://launchpad.net/$_pkgname/trunk/$pkgver/+download/$_pkgname-$pkgver.tar.gz.asc")
sha256sums=('140e43fc16d4352a98a90a450c6326bee5e6de73ae373a569947f3b505405034'
            'SKIP')
validpgpkeys=('8417157EDBE73D9EAC1E539B126EB563A74B06BF')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

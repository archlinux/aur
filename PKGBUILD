# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=('python-ceilometerclient'
         'python2-ceilometerclient')
pkgver='1.5.0'
pkgrel='1'
pkgdesc='Python client library for Ceilometer'
arch=('any')
url='https://launchpad.net/python-ceilometerclient'
license=('Apache')
source=("https://pypi.python.org/packages/source/${pkgname:0:1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('f81284c1ac025ba65ac0e630a3bb01d4fd73ad087b9e1218cf677ac42180112c')

package_python-ceilometerclient() {
    depends=('python-pbr'
             'python-iso8601'
             'python-oslo-i18n'
             'python-oslo-serialization'
             'python-oslo-utils'
             'python-prettytable'
             'python-keystoneclient'
             'python-requests'
             'python-six'
             'python-stevedore')
    makedepends=('python-setuptools')
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py \
        install \
        --root="${pkgdir}" \
        --optimize=1
}

package_python2-ceilometerclient() {
    depends=('python2-pbr'
             'python2-iso8601'
             'python2-oslo-i18n'
             'python2-oslo-serialization'
             'python2-oslo-utils'
             'python2-prettytable'
             'python2-keystoneclient'
             'python2-requests'
             'python2-six'
             'python2-stevedore')
    makedepends=('python-setuptools')
    cd "${srcdir}/python-ceilometerclient-${pkgver}"
    python2 setup.py \
        install \
        --root="${pkgdir}" \
        --optimize=1
    mv "${pkgdir}"/usr/bin/ceilometer{,2}
}

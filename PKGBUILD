# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=('python-ceilometerclient'
         'python2-ceilometerclient')
pkgver='2.3.0'
pkgrel='1'
pkgdesc='Python client library for Ceilometer'
arch=('any')
url='https://launchpad.net/python-ceilometerclient'
license=('Apache')
source=("https://pypi.python.org/packages/source/${pkgname:0:1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('a2a599619dee58bfc7715c8253ae9642053689d43f4f334ffc85285d56ef7596')

makedepends=('python-setuptools'
             'python2-setuptools')

package_python-ceilometerclient() {
    depends=('python-pbr'
             'python-iso8601'
             'python-oslo-i18n'
             'python-oslo-serialization'
             'python-oslo-utils'
             'python-prettytable'
             'python-keystoneauth1'
             'python-keystoneclient'
             'python-requests'
             'python-six'
             'python-stevedore')
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
             'python2-keystoneauth1'
             'python2-keystoneclient'
             'python2-requests'
             'python2-six'
             'python2-stevedore')
    cd "${srcdir}/python-ceilometerclient-${pkgver}"
    python2 setup.py \
        install \
        --root="${pkgdir}" \
        --optimize=1
    mv "${pkgdir}"/usr/bin/ceilometer{,2}
}

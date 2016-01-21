# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=('python-ceilometerclient'
         'python2-ceilometerclient')
pkgver='2.2.1'
pkgrel='1'
pkgdesc='Python client library for Ceilometer'
arch=('any')
url='https://launchpad.net/python-ceilometerclient'
license=('Apache')
source=("https://pypi.python.org/packages/source/${pkgname:0:1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('3939d3853599cec2cdd8f1d1353c4e10f10536fa9c50d919836d3ad9c8e246ea')

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
             'python2-keystoneauth1'
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

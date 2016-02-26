# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=('python-heatclient'
         'python2-heatclient')
pkgver='0.9.0'
pkgrel='1'
pkgdesc='Python client library for Heat'
arch=('any')
url='https://launchpad.net/python-heatclient'
license=('Apache')
makedepends=('python-setuptools'
             'python2-setuptools')
source=("https://pypi.python.org/packages/source/${pkgname:0:1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('3a393de49239c3e6a82e2ce819684f262cb6f48ec70542d1d3dfb7aa690c7574')

package_python-heatclient()
{
    depends=('python-babel'
             'python-pbr'
             'python-iso8601'
             'python-prettytable'
             'python-oslo-i18n'
             'python-oslo-serialization'
             'python-oslo-utils'
             'python-keystoneclient'
             'python-swiftclient'
             'python-yaml'
             'python-requests'
             'python-six')
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py \
        install \
            --root="${pkgdir}" \
            --optimize=1
}

package_python2-heatclient()
{
    depends=('python2-babel'
             'python2-pbr'
             'python2-iso8601'
             'python2-prettytable'
             'python2-oslo-i18n'
             'python2-oslo-serialization'
             'python2-oslo-utils'
             'python2-keystoneclient'
             'python2-swiftclient'
             'python2-yaml'
             'python2-requests'
             'python2-six')
    makedepends=('python2-setuptools')
    cd "${srcdir}/python-heatclient-${pkgver}"
    python2 setup.py \
        install \
            --root="${pkgdir}" \
            --optimize=1
    mv "${pkgdir}"/usr/bin/heat{,2}
}

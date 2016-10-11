# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=('python-heatclient'
         'python2-heatclient')
pkgver='1.5.0'
pkgrel='1'
pkgdesc='Python client library for Heat'
arch=('any')
url='https://launchpad.net/python-heatclient'
license=('Apache')
makedepends=('python-setuptools'
             'python2-setuptools')
source=("https://github.com/openstack/python-heatclient/archive/${pkgver}.tar.gz")
sha256sums=('c67c75547636552afd28a6788d5adb54de926663361fdf63126ea9b7db831178')

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

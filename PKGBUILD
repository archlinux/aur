# Maintainer: Erhan SAHIN < erhan@ssahin.net >

pkgname=("python2-openstackclient-kilo")
pkgver="1.0.3"
pkgrel="1"
pkgdesc="OpenStack Command-Line Client"
arch=("any")
url="https://launchpad.net/python-openstackclient"
depends=("python2-babel>=1.3"
             "python2-cliff-kilo"
             "python2-cliff-tablib>=1.0"
             "python2-oslo-config>=1.9.3"
             "python2-oslo-i18n-kilo"
             "python2-oslo-serialization-kilo"
             "python2-oslo-utils-kilo"
             "python2-requests>=2.2.0"
             "python2-stevedore-kilo>")
makedepends=("python2-pbr>=0.6"
             "python2-pip"
             "python2-setuptools")
provides=('python2-openstackclient')
license=("Apache")
source=("https://pypi.python.org/packages/source/p/python-openstackclient/python-openstackclient-${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "${srcdir}/python-openstackclient-${pkgver}"
    sed -i '/pbr/d' requirements.txt
}

package_python2-openstackclient-kilo() {
    cd "${srcdir}/python-openstackclient-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}

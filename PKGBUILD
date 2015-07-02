# Maintainer: Erhan SAHIN < erhan@ssahin.net >

pkgname=("python2-openstackclient-liberty")
pkgver="1.4.0"
pkgrel="1"
pkgdesc="OpenStack Command-Line Client"
arch=("any")
url="https://launchpad.net/python-openstackclient"
depends=("python2-babel>=1.3"
             "python2-cliff-liberty"
             "python2-cliff-tablib-liberty"
             "python2-os-client-config"
             "python2-oslo-config-liberty"
             "python2-oslo-i18n-liberty"
             "python2-oslo-utils-liberty"
             "python2-glanceclient-liberty"
             "python2-keystoneclient-liberty"
             "python2-novaclient-liberty"
             "python2-neutronclient-liberty"
             "python2-requests>=2.5.2"
             "python2-stevedore-openstack")
makedepends=("python2-pip"
             "python2-setuptools")
provides=('python2-openstackclient')
license=("Apache")
source=("https://pypi.python.org/packages/source/p/python-openstackclient/python-openstackclient-${pkgver}.tar.gz")
sha256sums=('9530a82c9785284f40705e63862cdd5a22c19da05e2712f4681eaa1bf6cc3cd8')

prepare() {
    cd "${srcdir}/python-openstackclient-${pkgver}"
    sed -i '/pbr/d' requirements.txt
}

package_python2-openstackclient-liberty() {
    cd "${srcdir}/python-openstackclient-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}

# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname="python2-oslo-vmware-kilo"
pkgver=0.11.1
pkgrel=1
pkgdesc="Oslo VMware library for Openstack projects"
arch=("x86_64")
url="https://pypi.python.org/pypi/oslo.vmware"
license=("Apache")
depends=(
    "python2-oslo-concurrency-kilo"
    "python2-urllib3>=1.8.3"
    "python2-requests>=2.2.0"
    "python2-httplib2>=0.7.5"
    "python2-eventlet>=0.16.1"
    "python2-suds>=0.4"
    "python2-yaml>=3.1.0"
    "python2-babel>=1.3"
    "python2-oslo-utils-kilo"
    "python2-oslo-serialization-kilo"
    "python2-oslo-i18n-kilo"
    "python2-six>=1.9.0"
    "python2-iso8601>=0.1.9"
    "python2-netaddr>=0.7.12"
    "python2-stevedore-kilo"
    "python2-pbr>=0.6"
)
makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/o/oslo.vmware/oslo.vmware-${pkgver}.tar.gz")
sha256sums=('594231dfeb2294d2cee627da9c4ec8438d985c03e4e711f8d10c073641cde293')

build() {
  cd "${srcdir}/oslo.vmware-${pkgver}/"
  python2 setup.py build
}

package() {
  cd "${srcdir}/oslo.vmware-${pkgver}/"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname="python2-oslo-vmware-liberty"
pkgver=0.14.0
pkgrel=1
pkgdesc="Oslo VMware library for Openstack projects"
arch=("x86_64")
url="https://pypi.python.org/pypi/oslo.vmware"
license=("Apache")
depends=(
    "python2-pbr>=0.11"
    "python2-stevedore-openstack"
    "python2-netaddr>=0.7.12"
    "python2-iso8601>=0.1.9"
    "python2-six>=1.9.0"
    "python2-oslo-i18n-liberty"
    "python2-oslo-utils-liberty"
    "python2-babel>=1.3"
    "python2-yaml>=3.1.0"
    "python2-suds-jurko>=0.6"
    "python2-eventlet>=0.17.3"
    "python2-requests>=2.5.2"
    "python2-urllib3>=1.8.3"
    "python2-oslo-concurrency-liberty"
)
makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/o/oslo.vmware/oslo.vmware-${pkgver}.tar.gz")
sha256sums=('adb8fa8a4cb496dd779fc91f6de56de8f997e3e64519b23690784e090103892d')

build() {
  cd "${srcdir}/oslo.vmware-${pkgver}/"
  python2 setup.py build
}

package() {
  cd "${srcdir}/oslo.vmware-${pkgver}/"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

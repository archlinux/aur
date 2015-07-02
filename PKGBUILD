# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname=("python2-glance-store-liberty")
pkgver="0.6.0"
pkgrel="1"
pkgdesc="OpenStack Glance backend store-drivers Library"
arch=("any")
url="https://github.com/openstack/glance_store"
license=("Apache")
makedepends=("python2-setuptools" )
source=("https://pypi.python.org/packages/source/g/glance_store/glance_store-${pkgver}.tar.gz")
sha256sums=('249c99818f7ebd1b3aea6c96a66e4e17351a1d9befaef885dada0483be6ee818')
depends=("python2-oslo-config-liberty"
         "python2-oslo-i18n-liberty"
         "python2-oslo-serialization-liberty"
         "python2-oslo-utils-liberty"
         "python2-oslo-concurrency-liberty"
         "python2-stevedore-openstack"
         "python2-enum34"
         "python2-cinderclient-liberty"
         "python2-eventlet>=0.17.3"
         "python2-six>=1.9.0"
         "python2-jsonschema>=2.0.0")

build() {
    cd "${srcdir}/glance_store-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/glance_store-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}


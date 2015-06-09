# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname=("python2-glance-store-kilo")
pkgver="0.4.0"
pkgrel="1"
pkgdesc="OpenStack Glance backend store-drivers Library"
arch=("any")
url="https://github.com/openstack/glance_store"
license=("Apache")
makedepends=("python2-setuptools" )
source=("https://pypi.python.org/packages/source/g/glance_store/glance_store-${pkgver}.tar.gz")
sha256sums=('cd15e9f9a08dc8d3eeaa452682c8e53423f848eaadf064c0ee8068583aa31154')
depends=("python2-oslo-config>=1.6.0"
         "python2-oslo-i18n-kilo"
         "python2-oslo-serialization-kilo"
         "python2-oslo-utils-kilo"
         "python2-oslo-concurrency-kilo"
         "python2-stevedore-kilo"
         "python2-enum34"
         "python2-cinderclient-kilo"
         "python2-eventlet>=0.13.0"
         "python2-six>=1.4.1"
         "python2-jsonschema>=2.0.0")

build() {
    cd "${srcdir}/glance_store-${pkgver}"
    python2 setup.py build
}

package() {
    depends=("python2-oslo-config>=1.6.0"
    	     "python2-oslo-i18n-kilo"
    	     "python2-oslo-serialization-kilo"
    	     "python2-oslo-utils-kilo"
	     "python2-oslo-concurrency-kilo"
    	     "python2-stevedore-kilo"
             "python2-enum34"
             "python2-cinderclient-kilo"
             "python2-eventlet>=0.13.0"
             "python2-six>=1.4.1"
             "python2-jsonschema>=2.0.0")
    cd "${srcdir}/glance_store-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}


# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname=neutron-fwaas-kilo
pkgver=2015.1.0
pkgrel=1
pkgdesc="Neutron Firewall as a Service service"
arch=(any)
install=neutron-fwaas.install
url=https://launchpad.net/neutron
license=(Apache)
depends=('python2-pbr>=0.6'
         'python2-pbr<1.0'
         'python2-eventlet>=0.16.1'
         'python2-httplib2>=0.7.5'
         'python2-netaddr>=0.7.12'
         'python2-sqlalchemy-kilo'
         'python2-alembic>=0.7.2'
         'python2-six>=1.9.0'
         'python2-oslo-config>=1.9.3'
         'python2-oslo-db-kilo'
         'python2-oslo-log-kilo'
         'python2-oslo-messaging-kilo'
         'python2-oslo-serialization-kilo'
         'python2-oslo-utils-kilo'
         'neutron-kilo')
makedepends=(python2-setuptools)
source=("https://launchpad.net/neutron/kilo/${pkgver}/+download/neutron-fwaas-${pkgver}.tar.gz")
md5sums=('f9ca5ae8f3187c3e45bec2c5f7b87cf2')

build() {
    cd neutron-fwaas-${pkgver}/
    python2 setup.py build
}

package() {
    cd neutron-fwaas-${pkgver}/
    python2 setup.py install --root="${pkgdir}" --optimize=1
    mv "${pkgdir}"/usr/etc "${pkgdir}"/
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/neutron-fwaas/LICENSE
}


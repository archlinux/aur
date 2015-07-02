# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname="python2-oslo-messaging-liberty"
_pkgname="oslo.messaging"
pkgver=1.15.0
pkgrel=1
pkgdesc="Oslo Messaging API"
arch=("any")
url="https://pypi.python.org/pypi/oslo.messaging/"
license=("Apache")

depends=(
  "python2"
  "python2-babel>=1.3"
  "python2-eventlet>=0.13.0"
  "python2-iso8601>=0.1.9"
  "python2-kombu>=2.4.8"
  "python2-oslo-config-liberty"
  "python2-six>=1.6.0"
  "python2-stevedore-openstack"
  "python2-yaml>=3.1.0"
)

makedepends=("python2-setuptools")
provides=('python2-oslo-messaging')
source=("https://pypi.python.org/packages/source/o/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('2f25ea2cb844b51c5bd2d39798fa21e3')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}/"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}/"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

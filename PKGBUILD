# Maintainer: François Magimel <magimel.francois@gmail.com>
# Contributor: James Bulmer <nekinie@gmail.com>

pkgname="python2-oslo-messaging"
_pkgname="oslo.messaging"
pkgver=1.3.1
pkgrel=2
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
  "python2-oslo-config>=1.2.0"
  "python2-six>=1.6.0"
  "python2-stevedore>=0.14"
  "python2-yaml>=3.1.0"
)

makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/o/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('ea5fd4c62c514f5102f66815fad35da6')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}/"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}/"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

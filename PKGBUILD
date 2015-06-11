# Maintainer: François Magimel <magimel.francois@gmail.com>
# Contributor: James Bulmer <nekinie@gmail.com>

pkgname="python2-oslo-messaging-kilo"
_pkgname="oslo.messaging"
pkgver=1.8.2
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
  "python2-oslo-config>=1.2.0"
  "python2-six>=1.6.0"
  "python2-stevedore-kilo"
  "python2-yaml>=3.1.0"
)

makedepends=("python2-setuptools")
provides=('python2-oslo-messaging')
source=("https://pypi.python.org/packages/source/o/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('9ea5aafc2e9857e7ea9241e0782651dc')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}/"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}/"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

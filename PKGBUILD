# Maintainer: Eduardo Leggiero <https://www.leggiero.uk/>
# Contributor: Michael Herold <arch@michaeljherold.com>

_pkgname=scudcloud
pkgname=${_pkgname}-git
pkgver=v1.50.r62.gaaf496b
pkgrel=1
pkgdesc="A Linux client for Slack"
arch=('any')
url="https://github.com/raelgc/${_pkgname}"
license=('MIT')
depends=('python-dbus' 'python-pyqt5')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git://github.com/raelgc/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  python setup.py build
}
package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install --root="$pkgdir" --optimize=1
}

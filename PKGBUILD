# Maintainer: nblock <nblock [/at\] archlinux DOT us>
# Contributor: drakkan <[email protected]>

pkgname=python2-setproctitle
pkgver=1.1.10
pkgrel=1
pkgdesc="allows a python process to change its process title"
arch=('i686' 'x86_64')
url="https://github.com/dvarrazzo/py-setproctitle"
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools' 'git')
source=($pkgname-$pkgver::git+https://github.com/dvarrazzo/py-setproctitle#tag=version-$pkgver)
options=(!emptydirs)
sha256sums=('SKIP')

build() {
  cd ${srcdir}/$pkgname-${pkgver}
  python2 setup.py build
}

package() {
  cd ${srcdir}/$pkgname-${pkgver}
  python2 setup.py install --root=${pkgdir} --optimize=1
}

# vim:set ts=2 sw=2 et:

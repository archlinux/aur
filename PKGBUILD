# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# Contributor: veox <veox at wemakethings dot net>

pkgname=python2-autobahn
pkgver=0.10.5
pkgrel=1
pkgdesc="Twisted-based WebSocket/WAMP client and server framework"
url="http://autobahn.ws/python/"
arch=('any')
license=('Apache')
depends=('python2' 'twisted' 'python2-six')
makedepends=('python2-setuptools')
source=(https://pypi.python.org/packages/source/a/autobahn/autobahn-$pkgver.tar.gz)
md5sums=('75cbbead47bdac8ee606ca3ce9ee742e')

build() {
  cd "$srcdir/autobahn-${pkgver/_/-}"
  python2 setup.py build
}

package() {
  cd "$srcdir/autobahn-${pkgver/_/-}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ft=sh ts=2 sw=2 et:

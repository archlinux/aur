pkgname=python2-gwebsockets
pkgver=0.4
pkgrel=1
pkgdesc="A websocket server written in python. It uses GIO for network communication and hence it easily integrates with the GLib mainloop."
url="https://pypi.python.org/pypi/gwebsockets"
license=('Apache')
arch=('any')
depends=('python2>=2.7.9' 'glib2')
makedepends=('python2-setuptools')

source=(http://pypi.python.org/packages/source/g/gwebsockets/gwebsockets-$pkgver.tar.gz)
md5sums=('a0d1bd9e6e1b2aae5754e35234e3b838')

build() {
  cd "$srcdir/gwebsockets-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/gwebsockets-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}

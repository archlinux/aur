# Maintainer: Florian Bruhin <archlinux.org@the-compiler.org>
# Contributor: Bruno Galeotti <bgaleotti at gmail dot com>

pkgname=python2-websocket-client
pkgver=0.32.0
pkgrel=1
pkgdesc="Websocket client for Python."
url="https://github.com/liris/websocket-client"
license=('LGPL')
arch=('any')
depends=('python2>=2.7.9' 'python2-six')
makedepends=('python2-setuptools')

source=(http://pypi.python.org/packages/source/w/websocket-client/websocket_client-$pkgver.tar.gz)
md5sums=('b07a897511a3c585251fe2ea85a9d9d9')

build() {
  cd "$srcdir/websocket_client-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/websocket_client-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
  rm "$pkgdir/usr/bin/wsdump.py"  # provided by python3 package
}

# vim: ts=2 sts=2 sw=2 et ft=sh

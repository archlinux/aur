# Maintainer: Florian Bruhin <archlinux.org@the-compiler.org>
# Contributor: Bruno Galeotti <bgaleotti at gmail dot com>

pkgname=python2-websocket-client
pkgver=0.30.0
pkgrel=2
pkgdesc="Websocket client for Python."
url="https://github.com/liris/websocket-client"
license=('LGPL')
arch=('any')
depends=('python2>=2.7.9' 'python2-six')
makedepends=('python2-setuptools')

source=(http://pypi.python.org/packages/source/w/websocket-client/websocket_client-$pkgver.tar.gz)
sha512sums=('e131d84c1b2e477f47baf0fdf0a6dc21f0ea56f6e629a0febd56c6de06ff232d306c2d93a9f824ce84f44827e5cc56c6146dc0c1ceea3a8a63af1e1adae9b17c')

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

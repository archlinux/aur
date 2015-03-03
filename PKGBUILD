# Maintainer: Florian Bruhin <archlinux.org@the-compiler.org>
# Contributor: Bruno Galeotti <bgaleotti at gmail dot com>

pkgname=python2-websocket-client
pkgver=0.25.0
pkgrel=1
pkgdesc="Websocket client for Python."
url="https://github.com/liris/websocket-client"
license=('LGPL')
arch=('any')
depends=('python2>=2.7.9' 'python2-six')
makedepends=('python2-setuptools')

source=(http://pypi.python.org/packages/source/w/websocket-client/websocket-client-$pkgver.tar.gz)
sha512sums=('6c4b441bc96f0a391450c1f47f0970dd2d63a08bc712500130fd8a2b8b2cb9f0ccf16f88d2ec0c6832dcc4d339479dd5abf21d89694be73dc17e7f1c153f5448')

build() {
  cd "$srcdir/websocket-client-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/websocket-client-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
  rm "$pkgdir/usr/bin/wsdump.py"  # provided by python3 package
}

# vim: ts=2 sts=2 sw=2 et ft=sh

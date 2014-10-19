# Maintainer: Florian Bruhin <archlinux.org@the-compiler.org>
# Contributor: Bruno Galeotti <bgaleotti at gmail dot com>

pkgname=python2-websocket-client
pkgver=0.21.0
pkgrel=1
pkgdesc="Websocket client for Python."
url="https://github.com/liris/websocket-client"
license=('LGPL')
arch=('any')
depends=('python2>=2.7' 'python2-backports.ssl_match_hostname' 'python2-six')

makedepends=('python2-distribute')
source=(http://pypi.python.org/packages/source/w/websocket-client/websocket-client-$pkgver.tar.gz)
sha512sums=('dee89e4da67f28137ffd7d014142876ad4265f3bc21aa608b848c5f6f8dd06a592e818ea3a5fc62a9c0ccd5fa142aade0efc20c8556653003c09d9bd46c00695')

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
